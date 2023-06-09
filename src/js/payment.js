// This is your test publishable API key.
const stripe = Stripe("pk_test_51HvfSXFV0g6r9YWu0aO2IbDbRx6jzJ4hdo37ucjKYKsoHSxV1cYyGSJEKFeAKHFGfrVEd4cHPRwfMScqYOnfsdsr00ShkBAVg0");

// The items the customer wants to buy
// const items = [{ id: "xl-tshirt" }];

let elements;

initialize();
checkStatus();

document
    .querySelector("#payment-form")
    .addEventListener("submit", handleSubmit);

const emailAddress = 'cs@goodtime.com';
// Fetches a payment intent and captures the client secret
async function initialize() {
    const amt = sessionStorage.getItem("payment");
    // sessionStorage.removeItem("payment");
    const response = await fetch('../../php/frontend/payment.php'
        // , { method: "POST", amt: amt }
    );
    const { client_secret: clientSecret } = await response.json();
    // Render the form using the clientSecret


    const options = {

        //拿到clientSecret可以進行授權
        clientSecret: clientSecret,
        //自訂外觀api設定 文件:https://stripe.com/docs/elements/appearance-api#theme
        appearance: {/*...*/ },
        //這邊自動填入加入客戶是他的mail(對應linkAuthentication)
        loader: "auto"
    };


    //create stripe要的物件(可選在options裡面添加)
    elements = stripe.elements(options);

    //建立客戶
    const linkAuthenticationElement = elements.create("linkAuthentication");
    linkAuthenticationElement.mount("#link-authentication-element");

    const paymentElementOptions = {
        layout: "tabs",

    };

    //建立付款
    const paymentElement = elements.create("payment", paymentElementOptions);
    paymentElement.mount("#payment-element");
}

async function handleSubmit(e) {
    e.preventDefault();
    setLoading(true);

    const { error } = await stripe.confirmPayment({
        elements,
        confirmParams: {
            //完成付款(or失敗要跳轉的頁面)
            // return_url: "https://tibamef2e.com/tgd103/g3/tgd103_g3_goodtime/dist/html/shopping_cart03.html",
            return_url: "http://localhost/teamwork/src/html/shopping_cart03.html",
            receipt_email: emailAddress,
        },
    });

    // This point will only be reached if there is an immediate error when
    // confirming the payment. Otherwise, your customer will be redirected to
    // your `return_url`. For some payment methods like iDEAL, your customer will
    // be redirected to an intermediate site first to authorize the payment, then
    // redirected to the `return_url`.
    if (error.type === "card_error" || error.type === "validation_error") {
        showMessage(error.message);
        //這邊可以用alert請使用者重新輸入或者另設popup
        alert("失效卡片");
    } else {
        showMessage("An unexpected error occurred.");
    }

    setLoading(false);
}

// 支付提交後獲取paymentIntent的狀態
async function checkStatus() {
    const clientSecret = new URLSearchParams(window.location.search).get(
        "payment_intent_client_secret"
    );

    if (!clientSecret) {
        return;
    }

    //檢查PaymentIntent(成功才會跳轉頁面)
    const { paymentIntent } = await stripe.retrievePaymentIntent(clientSecret);

    switch (paymentIntent.status) {
        case "succeeded":
            showMessage("Payment succeeded!");
            break;
        case "processing":
            showMessage("Your payment is processing.");
            break;
        case "requires_payment_method":
            showMessage("Your payment was not successful, please try again.");
            //這邊下面可以定義另外導向其他頁面或者reload讓使用者重新付款
            break;
        default:
            showMessage("Something went wrong.");
            break;
    }
}

// ------- UI helpers -------

function showMessage(messageText) {
    const messageContainer = document.querySelector("#payment-message");

    messageContainer.classList.remove("hidden");
    messageContainer.textContent = messageText;

    setTimeout(function () {
        messageContainer.classList.add("hidden");
        messageText.textContent = "";
    }, 4000);
}

// Show a spinner on payment submission
function setLoading(isLoading) {
    if (isLoading) {
        // Disable the button and show a spinner
        document.querySelector("#submit").disabled = true;
        document.querySelector("#spinner").classList.remove("hidden");
        document.querySelector("#button-text").classList.add("hidden");
    } else {
        document.querySelector("#submit").disabled = false;
        document.querySelector("#spinner").classList.add("hidden");
        document.querySelector("#button-text").classList.remove("hidden");
    }
}
console.log("aaa")
$(() => {
  $("#header").load("topbar.html");
  $("#footer").load("footer.html");
});

/*-----------------google api 第三方登入-----------------*/

// handleCallback用來處理回傳憑證，登入後有呼叫這個function表示成功登入
function handleCallback1(response) {
  console.log(response);
}

//credential 是 base64 的 JWT Token，可以用解碼的方式拿到使用者資料，這邊用stackoverflow 找到的 function 來執行
function parseJwt(token) {
  var base64Url = token.split(".")[1];
  var base64 = base64Url.replace(/-/g, "+").replace(/_/g, "/");
  var jsonPayload = decodeURIComponent(
    atob(base64)
      .split("")
      .map(function (c) {
        return "%" + ("00" + c.charCodeAt(0).toString(16)).slice(-2);
      })
      .join("")
  );

  return JSON.parse(jsonPayload);
}
function handleCallback2(response) {
  const data = parseJwt(response.credential);
  console.log(data);
}

/*-------------------抓取使用者輸入資料傳入後台驗證------------------*/
const loginApp = Vue.createApp({
  data() {
    return {
      user_email: "",
      user_password: "",

    };
  },
  methods: {
    textTosend() {
      if (this.user_email == "") {
        alert("請輸入您的帳號");
        return false;
      }

      if (
        !/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/.test(
          this.user_email
        )
      ) {
        alert("請輸入正確格式");
        return false;
      }

      if (this.user_password == "") {
        alert("請輸入您的密碼");
        return false;
      }

      // axios.post('url') = 我們要獲取的API，會回傳一個 Promise 物件
      axios
        .post("../../php/frontend/login.php", {
          user_email: this.user_email,
          user_password: this.user_password,
        })

        // then :處理 Promise返回的結果
        .then((res) => {
          if (res.data === "登入成功") {
            alert(res.data);
            // console.log(res);
            sessionStorage.setItem("login", '1')
            window.location.href = "../html/memberCenter.html";
          } else {
            alert(res.data);
          }
        })
        //catch:抓取Promise 上異常
        .catch((err) => console.log("[login error]", err));
    },
  },
}).mount("#log_in");

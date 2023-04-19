console.log("kkkkk");

const signUpApp = Vue.createApp({
  data() {
    return {
      user_email: "",
      user_password: "",
      user_confirm_password: "",
      user_name: "",
      user_phone: "",
      user_addr: "",
    };
  },
  methods: {
    textTosend() {
      if (this.user_email == "") {
        alert("請輸入您的電子信箱");
        return false;
      }
      if (
        !/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/.test(
          this.user_email
        )
      ) {
        alert("請輸入正確的信箱格式");
        return false;
      }

      if (this.user_password == "") {
        alert("請輸入您的密碼");
        return false;
      }

      if (this.user_password != this.user_confirm_password) {
        alert("請輸入正確密碼");
        return false;
      }

      if (this.user_name == "") {
        alert("請輸入您的姓名");
        return false;
      }

      if (!/^[\u0391-\uFFE5]+$/.test(this.user_name)) {
        alert("姓名格式不正確，請重新輸入");
        return false;
      }

      if (this.user_phone == "") {
        alert("請輸入您的手機號碼");
        return false;
      }

      if (!/^09[0-9]{8}$/.test(this.user_phone)) {
        alert("手機號碼格式不正確，請重新輸入");
        return false;
      }

      if (this.user_addr == "") {
        alert("請輸入您的地址");
        return false;
      }

      // axios.post('url') = 我們要獲取的API，會回傳一個 Promise 物件
      axios
        .post("../../php/frontend/signUp.php", {
          user_email: this.user_email,
          user_password: this.user_password,
          user_name: this.user_name,
          user_phone: this.user_phone,
          user_addr: this.user_addr,
        })

        // then :處理 Promise返回的結果
        .then((res) => {
          if (
            res.data === "已有帳號使用此電子郵件地址。請選擇其他電子郵件地址。"
          ) {
            // console.log(res);
            alert("已有帳號使用此電子郵件地址。請選擇其他電子郵件地址。");
          } else {
            alert("會員註冊成功，請重新登入");
            // window.location.href = "../html/log_in.html";
          }
        })
        //catch:抓取Promise 上異常
        .catch((err) => console.log("[signup error]", err));
    },
  },
}).mount("#sign_up-login");

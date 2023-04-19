const forgotPwdApp = Vue.createApp({
  data() {
    return {
      user_email: "",
      user_verify: "",
      sentEmail: "無此信箱",
      user_pwd: "",
      message1: "",
      user_repwd: "",
      message2: "",
      isDisabl: false,
      Num: "",
    };
  },
  mounted() {
    const that = this;
    for (var i = 0; i < 6; i++) {
      that.Num += Math.floor(Math.random() * 10).toString();
    }
  },
  methods: {
    emailConfirm() {
      // alert("驗證信已送出");
      axios
        .post("../../php/frontend/forgotPwd.php", {
          user_email: this.user_email,
          user_pwd: "",
        })
        .then((list) => {
          console.log(list.data);
          this.sentEmail = list.Email;
          // console.log(list[0].EMAIL);
          for (var i = 0; i < 6; i++) {
            this.Num += Math.floor(Math.random() * 10).toString();
          }
          this.emailGo();
        });
    },
    correct() {
      if (this.user_verify == this.Num) {
        if (this.message2 == "" && this.message1 == "") {
          axios
            .post("../../php/frontend/forgotPwd.php", {
              user_email: this.user_email,
              user_pwd: this.user_pwd,
            })
            .then(alert("修改成功"), (location = "../html/log_in.html"));
        } else {
          alert("密碼不相同，請重新輸入");
        }
      } else {
        alert("驗證碼錯誤");
      }
      // that.message2 =='' && that.message1 ==''
    },
    emailGo() {
      let that = this;
    //   console.log(1234);
      emailjs.init("MBmqTNGDNSS06V5eu");
      const serviceID = "service_um2vgfn";
      const templateID = "template_spfa30o";
      const templateParams = {
        email: this.email,
        message: this.Num,
      };
      emailjs.send(serviceID, templateID, templateParams).then(
        function (response) {
          that.isDisabl = true;
          console.log(this.isDisabl);
          alert("驗證信已送出");
          // console.log("SUCCESS!", response.status, response.text);
        },
        function (error) {
          // console.log("FAILED...", error);
        }
      );
    },
  },
}).mount("#forgot-pwd");



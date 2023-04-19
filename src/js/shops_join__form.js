
const shopsJoinFormApp = Vue.createApp({
  data() {
    return {
      shop__name: "",
      principal_name:"",
      principal_phone:"",
      principal_email:"",
      shopstay__time:"",
      Opinion:""
    };
  },
  methods: {
    
    ShopJoinTosend() {

      let formData = new FormData();
      formData.append('file',this.$refs.aaa.files[0])
      axios({
        method: "post",
        url: "../../php/frontend/shopsFormFile.php",
        data: formData,
        headers: {
          "Content-Type": "multipart/form-data",
          // 'Authorization': localStorage.getItem("authorization")
        },
      }).then((res) => {
        if (res.status === 200) {
          // alert(res.data);
          // window.location.href = "../html/rental_join_form.html";
        // } else {
          // alert(res.data);
        }
      });

      if (this.shop__name == "") {
        alert("請輸入您的品牌名稱");
        return false;
      }

      if (this.principal_name == "") {
        alert("請輸入負責人姓名");
        return false;
      }

      if (this.principal_phone == "") {
        alert("請輸入負責人電話");
        return false;
      }

      if (this.principal_email == "") {
        alert("請輸入負責人信箱");
        return false;
      }
console.log({
  shop__name: this.shop__name,
  principal_name:this.principal_name,
  principal_phone:this.principal_phone,
  principal_email:this.principal_email,
  shopstay__time:this.shopstay__time,
  Opinion:this.Opinion
})
      // axios.post('url') = 我們要獲取的API，會回傳一個 Promise 物件
      axios
        .post("../../php/frontend/shopsForm.php", {
          shop__name: this.shop__name,
          principal_name:this.principal_name,
          principal_phone:this.principal_phone,
          principal_email:this.principal_email,
          shopstay__time:this.shopstay__time,
          Opinion:this.Opinion
        })

        // then :處理 Promise返回的結果
        .then((res) => {
          if (res.status === 200) {
            alert("送出成功");
            // console.log(res);
            window.location.href = "../html/shops_join_form.html";
          } else {
            alert(res.data);
          }
        })
        //catch:抓取Promise 上異常
        .catch((err) => console.log("[login error]", err));
    },
  },
}).mount("#Join__form");

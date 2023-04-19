/*-----------------------資料串接-----------------------*/

const rentalJoinFormApp = Vue.createApp({
  data() {
    return {
      activity__name: "",
      applicant__unit: "",
      principal__name: "",
      unit__spacing: "",
      Contact__name: "",
      Contact__phone: "",
      nature__activity: [],
      place__spacing: "",
      ornamental__nature: "",
      other__demands: [],
      Opinion: "",
      date_pick__from: "",
      date_pick__to: "",
      file:"" ,
    };
  },
  methods: {
    demands_change() {
      if (this.other__demands.includes("無代售需求")) {
        this.other__demands = ["無代售需求"];
      }
    },

    rentalTosend() {

      let formData = new FormData();
      formData.append('file',this.$refs.aaa.files[0])
      axios({
        method: "post",
        url: "../../php/frontend/rentalFormFile.php",
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

      if (this.activity__name == "") {
        alert("請輸入您的活動名稱");
        return false;
      }

      if (this.applicant__unit == "") {
        alert("請輸入申請單位");
        return false;
      }

      if (this.principal__name == "") {
        alert("請輸入負責人姓名");
        return false;
      }

      if (this.unit__spacing == "") {
        alert("請選擇您的單位類別");
        return false;
      }

      if (this.Contact__name == "") {
        alert("請輸入您的聯絡人姓名");
        return false;
      }

      if (this.Contact__phone == "") {
        alert("請輸入您的聯絡人電話");
        return false;
      }
      if (this.place__spacing == "") {
        alert("請選擇您的場地");
        return false;
      }

      if (this.date_pick__from == "") {
        alert("請選擇活動開始時間");
        return false;
      }

      if (this.date_pick__to == "") {
        alert("請選擇活動結束時間");
        return false;
      }

      if (this.nature__activity == "") {
        alert("請選擇您的活動性質");
        return false;
      }

      if (this.ornamental__nature == "") {
        alert("請選擇您的觀賞性質");
        return false;
      }

      if (this.other__demands == "") {
        alert("請選擇其他需求");
        return false;
      }

      // axios.post('url') = 我們要獲取的API，會回傳一個 Promise 物件
      axios
        .post("../../php/frontend/rentalForm.php", {
          activity__name: this.activity__name,
          applicant__unit: this.applicant__unit,
          principal__name: this.principal__name,
          unit__spacing: this.unit__spacing,
          Contact__name: this.Contact__name,
          Contact__phone: this.Contact__phone,
          nature__activity: this.nature__activity,
          place__spacing: this.place__spacing,
          ornamental__nature: this.ornamental__nature,
          other__demands: this.other__demands,
          Opinion: this.Opinion,
          date_pick__from: this.date_pick__from,
          date_pick__to: this.date_pick__to,
        })

        // then :處理 Promise返回的結果
        .then((res) => {
          if (res.status === 200) {
            alert("送出成功");
            // console.log(res);
            window.location.href = "../html/rental_join_form.html";
          } else {
            alert(res.data);
          }
        })
        //catch:抓取Promise 上異常
        .catch((err) => console.log("[rental error]", err));
    },
  },
}).mount("#rental_join_form");

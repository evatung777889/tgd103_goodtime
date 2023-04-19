import Tab1Content from "./component/Tab1Content.js";
import Tab2Content from "./component/Tab2Content.js";

/* 頁首頁尾載入 */
$(() => {
  $("#header").load("topbar.html");
  $("#footer").load("footer.html");
});

/* 區塊滑動 */

$(function () {
  // 偵聽a click
  $(".nav-ctn li").bind("click", function () {
    var id = $(this).attr("data-nav");

    // 取得目標區塊的y座標
    var target_top = $("#item_" + id).offset().top - 100;

    // 取得body物件 這種寫法在各瀏覽器上最保險
    var $body = window.opera
      ? document.compatMode == "CSS1Compat"
        ? $("html")
        : $("body")
      : $("html,body");

    // 移動捲軸有動畫效果
    $body.animate(
      {
        scrollTop: target_top,
      },
      800
    );
  });
});


/* ----------------修改地址、修改密碼 -----------------*/

const memberCenterApp = Vue.createApp({
  data() {
    return {
      currentTab1: "tab1",
      popup: false,
      activeBlock: "acc",
      tabs1: [
        {
          id: "tab1",
          name: "修改地址",
        },
        {
          id: "tab2",
          name: "修改密碼",
        },
      ],
      addr: [
        // {
        //   LOCATION: "台北市松山區敦化北路100號2樓",
        //   clickId: "edit",
        // },
        // {
        //   LOCATION: "台北市中山區南京東路三段219號5樓",
        //   clickId: "edit",
        // },
      ],
      memberCenter: {},
      currentTab2: "tab1",
      tabs2: [
        {
          id: "tab1",
          name: "訂單查詢",
        },
        {
          id: "tab2",
          name: "訂單明細",
        },
      ], poList: {}, poDetail: {}
    }
  },
  //頁籤tab切換
  computed: {
    current_tab_component() {
      if (this.currentTab2 == "tab1") {
        this.poDetail = this.poList;
      }
      return this.currentTab2;
    }
  },
  methods: {
    //修改及確認資料按鈕
    changehtml(e) {
      // console.log(e)，這裡的e = index
      // console.log(this.addr[e]);
      this.addr[e].LOCATION = this.addr[e].LOCATION.trim();
      if (this.addr[e].clickId === "edit") {
        this.addr[e].clickId = "noEdit";
      } else {
        this.addr[e].clickId = "edit";
      }
      //使用者輸入空字串後跳出彈窗提醒
      if (this.addr[e].LOCATION === "") {
        alert("請輸入您的地址");
        this.addr[e].clickId = "noEdit";
      }

    },
    //新增地址按鈕
    addAddr() {
      //            抓陣列的最後一筆資料
      if (this.addr[this.addr.length - 1].addrText != "") {
        if (this.addr[this.addr.length - 1].clickId === "edit") {
          this.addr.push({
            addrText: "",
            clickId: "noEdit",
          });
        } else {
          alert("請先確認您的地址");
        }
      } else {
        alert("請先輸入您的地址");
      }

    },
    //刪除鈕
    deletehtml(e) {
      //如果input不是空字串，移除時會跳alert
      // console.log(e)
      // console.log(this.addr);
      if (this.addr[e].addrText != "") {
        this.popup = e; // e = index
        console.log(this.popup);
      } else {
        //如果input是空字串，直接移除
        this.addr.splice(e, 1);
      }
    },
    //刪除確認彈窗
    confirm() {
      this.addr.splice(this.popup, 1);
      this.popup = false;
    },
    textTosend() {
      // axios.post('url') = 我們要獲取的API，會回傳一個 Promise 物件
      axios
        .post("../../php/frontend/memberCenter.php", {
          mid: 5
        })
        // then :處理 Promise返回的結果
        .then((res) => { // 拿會員中心資料
          this.memberCenter = { ...res.data };
          this.addr = [...JSON.parse(JSON.stringify(this.memberCenter.address))];
          this.addr.forEach((address) => {
            address["clickId"] = "edit";
          });
          this.poList = this.memberCenter.po;
          this.poDetail = this.poList;
          console.log(this.memberCenter);
          // console.log(this.poDetail)
        })
        //catch:抓取Promise 上異常
        .catch((err) => console.log("[login error]", err));
    }, switchActive(string) {
      /* 標籤-active切換 */
      this.activeBlock = string;
    }, subtotal(obj) {
      let amt = 0;
      obj.forEach(attr => {
        amt += attr.UNIT_PRICE * attr.QTY;
      });
      return amt
    }
    // , switchTab2(idx) {
    //   this.poDetail = this.poList[idx];
    //   // console.log(this.poDetail);
    // }


  }, beforeMount() {
    this.textTosend();
  }
  // , beforeUpdate() {
  //   this.textTosend();
  // }
});


// 訂單查詢、訂單明細區塊

memberCenterApp.component("tab1-content", Tab1Content
  // {
  //   template: `
  //   <dl class="po-single">
  //                 <div>
  //                   <dt class="po-key">購買日期</dt>
  //                   <dd class="po-value">2022-12-10 10:00</dd>
  //                 </div>
  //                 <div>
  //                   <dt class="po-key">主單編號</dt>
  //                   <dd class="po-value">MO20221210A00001</dd>
  //                 </div>
  //                 <div>
  //                   <dt class="po-key">子單編號</dt>
  //                   <dd class="po-value">MM20221210A00001</dd>
  //                 </div>
  //                 <div>
  //                   <dt class="po-key">購買金額</dt>
  //                   <dd class="po-value">TWD$ 1,000元</dd>
  //                 </div>
  //                 <div>
  //                   <dt class="po-key">付款方式</dt>
  //                   <dd class="po-value">線上刷卡</dd>
  //                 </div>
  //                 <div>
  //                   <dt class="po-key">訂單狀態</dt>
  //                   <dd class="po-value">訂單已確認</dd>
  //                 </div>
  //               </dl>
  //               <dl class="po-single">
  //                 <div class="po-col">
  //                   <dt class="po-key">購買日期</dt>
  //                   <dd class="po-value">2022-12-10 10:00</dd>
  //                 </div>
  //                 <div class="po-col">
  //                   <dt class="po-key">主單編號</dt>
  //                   <dd class="po-value">MO20221210A00001</dd>
  //                 </div>
  //                 <div class="po-col">
  //                   <dt class="po-key">子單編號</dt>
  //                   <dd class="po-value">MM20221210A00001</dd>
  //                 </div>
  //                 <div class="po-col">
  //                   <dt class="po-key">購買金額</dt>
  //                   <dd class="po-value">TWD$ 1,000元</dd>
  //                 </div>
  //                 <div class="po-col">
  //                   <dt class="po-key">付款方式</dt>
  //                   <dd class="po-value">線上刷卡</dd>
  //                 </div>
  //                 <div class="po-col">
  //                   <dt class="po-key">訂單狀態</dt>
  //                   <dd class="po-value">訂單已確認</dd>
  //                 </div>
  //               </dl>
  // `,
  // }
);

// memberCenterApp.component("tab2-content", Tab2Content
//   //   {
//   //     template: `
//   //   <dl class="podetail">
//   //                 <div>
//   //                   <dt class="po-key">購買日期</dt>
//   //                   <dd class="po-value">2022-12-10 10:00</dd>
//   //                 </div>
//   //                 <div>
//   //                   <dt class="po-key">主單編號</dt>
//   //                   <dd class="po-value">MO20221210A00001</dd>
//   //                 </div>
//   //                 <div>
//   //                   <dt class="po-key">子單編號</dt>
//   //                   <dd class="po-value">MM20221210A00001</dd>
//   //                 </div>
//   //                 <div>
//   //                   <dt class="po-key">付款方式</dt>
//   //                   <dd class="po-value">線上刷卡</dd>
//   //                 </div>
//   //                 <div>
//   //                   <dt class="po-key">訂單狀態</dt>
//   //                   <dd class="po-value">訂單已確認</dd>
//   //                 </div>
//   //               </dl>
//   //               <dl class="po-item">
//   //                 <div class="item-single">
//   //                   <img src="../img/store/store05.jpg" alt="" />
//   //                   <div class="item-detail">
//   //                     <div>
//   //                       <p>蒙娜麗莎貓掛畫</p>
//   //                       <small>30” x 30”</small>
//   //                     </div>
//   //                     <div>
//   //                       <small>數量：1</small>
//   //                     </div>
//   //                     <div>
//   //                       <small>售價：NT$990</small>
//   //                     </div>
//   //                   </div>
//   //                 </div>
//   //                 <div class="item-single">
//   //                   <img src="../img/store/store06.jpg" alt="" />
//   //                   <div class="item-detail">
//   //                     <div>
//   //                       <p>蒙娜麗莎貓掛畫</p>
//   //                       <small>30” x 30”</small>
//   //                     </div>
//   //                     <div>
//   //                       <small>數量：1</small>
//   //                     </div>
//   //                     <div>
//   //                       <small>售價：NT$990</small>
//   //                     </div>
//   //                   </div>
//   //                 </div>
//   //                 <div class="item-single">
//   //                   <img src="../img/store/store11.jpg" alt="" />
//   //                   <div class="item-detail">
//   //                     <div>
//   //                       <p>蒙娜麗莎貓掛畫</p>
//   //                       <small>30” x 30”</small>
//   //                     </div>
//   //                     <div>
//   //                       <small>數量：1</small>
//   //                     </div>
//   //                     <div>
//   //                       <small>售價：NT$990</small>
//   //                     </div>
//   //                   </div>
//   //                 </div>
//   //                 <div class="item-single">
//   //                   <img src="../img/store/store13.jpg" alt="" />
//   //                   <div class="item-detail">
//   //                     <div>
//   //                       <p>蒙娜麗莎貓掛畫</p>
//   //                       <small>30” x 30”</small>
//   //                     </div>
//   //                     <div>
//   //                       <small>數量：1</small>
//   //                     </div>
//   //                     <div>
//   //                       <small>售價：NT$990</small>
//   //                     </div>
//   //                   </div>
//   //                 </div>
//   //                 <div class="item-single">
//   //                   <img src="../img/store/store15.jpg" alt="" />
//   //                   <div class="item-detail">
//   //                     <div>
//   //                       <p>蒙娜麗莎貓掛畫</p>
//   //                       <small>30” x 30”</small>
//   //                     </div>
//   //                     <div>
//   //                       <small>數量：1</small>
//   //                     </div>
//   //                     <div>
//   //                       <small>售價：NT$990</small>
//   //                     </div>
//   //                   </div>
//   //                 </div>
//   //               </dl>
//   //               <dl class="posum">
//   //                 <div>
//   //                   <dt class="po-key">小計：</dt>
//   //                   <dd class="po-value">NT$　4950</dd>
//   //                 </div>
//   //                 <div>
//   //                   <dt class="po-key">運費：</dt>
//   //                   <dd class="po-value">NT$　　60</dd>
//   //                 </div>
//   //                 <div>
//   //                   <dt class="po-key">總金額：</dt>
//   //                   <dd class="po-value">NT$　5010</dd>
//   //                 </div>
//   //               </dl>
//   // `
//   //   }
// );

memberCenterApp.mount("#memberCenter");

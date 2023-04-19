// import TabContent from "./component/TabContent.js";
// import tab2_content from "./component/tab2_content.js";
// 訂單查詢、訂單明細區塊

const app2 = Vue.createApp({
    // components:{ Tab1Content },
    data() {
      return {
        currentTab: "tab1",
        tabs: [
          {
            id: "tab1",
            name: "訂單查詢",
          },
          {
            id: "tab2",
            name: "訂單明細",
          },
        ], memberCenter:{}
      };
    },
    computed: {
      current_tab_component() {
        return this.currentTab + "_content";
      },
    },created(){
      axios.post("../../php/frontend/memberCenter.php", {
        mid: 5
      })
    
      // then :處理 Promise返回的結果
      .then((res) => { // 拿會員中心資料
        this.memberCenter = {...res.data};
        // this.memberCenter = ;
        this.memberCenter = JSON.parse(JSON.stringify(this.memberCenter.po));
        console.log(this.memberCenter);
      })
      //catch:抓取Promise 上異常
      .catch((err) => console.log("[login error]", err));
    }
  });
  
//   app2.component("TabContent", TabContent);
  
//   app2.component("tab2_content", {
//     template: `
//     <dl class="podetail">
//                   <div>
//                     <dt class="po-key">購買日期</dt>
//                     <dd class="po-value">2022-12-10 10:00</dd>
//                   </div>
//                   <div>
//                     <dt class="po-key">主單編號</dt>
//                     <dd class="po-value">MO20221210A00001</dd>
//                   </div>
//                   <div>
//                     <dt class="po-key">子單編號</dt>
//                     <dd class="po-value">MM20221210A00001</dd>
//                   </div>
//                   <div>
//                     <dt class="po-key">付款方式</dt>
//                     <dd class="po-value">線上刷卡</dd>
//                   </div>
//                   <div>
//                     <dt class="po-key">訂單狀態</dt>
//                     <dd class="po-value">訂單已確認</dd>
//                   </div>
//                 </dl>
//                 <dl class="po-item">
//                   <div class="item-single">
//                     <img src="../img/store/store05.jpg" alt="" />
//                     <div class="item-detail">
//                       <div>
//                         <p>蒙娜麗莎貓掛畫</p>
//                         <small>30” x 30”</small>
//                       </div>
//                       <div>
//                         <small>數量：1</small>
//                       </div>
//                       <div>
//                         <small>售價：NT$990</small>
//                       </div>
//                     </div>
//                   </div>
//                   <div class="item-single">
//                     <img src="../img/store/store06.jpg" alt="" />
//                     <div class="item-detail">
//                       <div>
//                         <p>蒙娜麗莎貓掛畫</p>
//                         <small>30” x 30”</small>
//                       </div>
//                       <div>
//                         <small>數量：1</small>
//                       </div>
//                       <div>
//                         <small>售價：NT$990</small>
//                       </div>
//                     </div>
//                   </div>
//                   <div class="item-single">
//                     <img src="../img/store/store11.jpg" alt="" />
//                     <div class="item-detail">
//                       <div>
//                         <p>蒙娜麗莎貓掛畫</p>
//                         <small>30” x 30”</small>
//                       </div>
//                       <div>
//                         <small>數量：1</small>
//                       </div>
//                       <div>
//                         <small>售價：NT$990</small>
//                       </div>
//                     </div>
//                   </div>
//                   <div class="item-single">
//                     <img src="../img/store/store13.jpg" alt="" />
//                     <div class="item-detail">
//                       <div>
//                         <p>蒙娜麗莎貓掛畫</p>
//                         <small>30” x 30”</small>
//                       </div>
//                       <div>
//                         <small>數量：1</small>
//                       </div>
//                       <div>
//                         <small>售價：NT$990</small>
//                       </div>
//                     </div>
//                   </div>
//                   <div class="item-single">
//                     <img src="../img/store/store15.jpg" alt="" />
//                     <div class="item-detail">
//                       <div>
//                         <p>蒙娜麗莎貓掛畫</p>
//                         <small>30” x 30”</small>
//                       </div>
//                       <div>
//                         <small>數量：1</small>
//                       </div>
//                       <div>
//                         <small>售價：NT$990</small>
//                       </div>
//                     </div>
//                   </div>
//                 </dl>
//                 <dl class="posum">
//                   <div>
//                     <dt class="po-key">小計：</dt>
//                     <dd class="po-value">NT$　4950</dd>
//                   </div>
//                   <div>
//                     <dt class="po-key">運費：</dt>
//                     <dd class="po-value">NT$　　60</dd>
//                   </div>
//                   <div>
//                     <dt class="po-key">總金額：</dt>
//                     <dd class="po-value">NT$　5010</dd>
//                   </div>
//                 </dl>
//   `
//   });
  
app2.mount("#item_po-block");
  
  
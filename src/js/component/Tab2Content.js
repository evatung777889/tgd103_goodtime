export default {
  props: { podprops: Object },
  computed: {
    totalAmt() {
      // console.log(this.podprops);
      return 1;
    },
    detail_array() {
      if (this.podprops.POD) {
        console.log('sss');
        return this.podprops.POD
      }
      return []
    }

  },
  mounted() {
    console.log(this.podprops, 'test');
    console.log(this.podprops.POD[0]);
  },
  template: `
    <div>
    <div class="podetail">
      <div>
        <div class="po-key">購買日期</div>
        <div class="po-value">{{podprops.CREATE_DATE}}</div>
      </div>
      <div>
        <div class="po-key">主單編號</div>
        <div class="po-value">{{podprops.PO_ID}}</div>
      </div>
      <div>
        <div class="po-key">付款方式</div>
        <div class="po-value">線上刷卡</div>
      </div>
      <div>
        <div class="po-key">訂單狀態</div>
        <div class="po-value">訂單已確認</div>
      </div>
    </div>

    <div class="po-item">
      <div class="item-single" v-for="prod in detail_array">
        <img src="../img/store/store05.jpg" alt="" />
        <div class="item-detail">
          <div>
            <p>蒙娜麗莎貓掛畫</p>
            <small>30” x 30”</small>
          </div>
          <div>
            <small>數量：1</small>
          </div>
          <div>
            <small>售價：NT$990</small>
          </div>
        </div>
      </div>
      
    </div>
    <div class="posum">
        <div>
          <div class="po-key">小計：</div>
          <div class="po-value">NT$　{{totalAmt}}</div>
        </div>
        <div>
          <div class="po-key">運費：</div>
          <div class="po-value">NT$　　60</div>
        </div>
        <div>
          <div class="po-key">總金額：</div>
          <div class="po-value">NT$ {{ totalAmt }}</div>
        </div>
      </div>
  </div>
  `
}
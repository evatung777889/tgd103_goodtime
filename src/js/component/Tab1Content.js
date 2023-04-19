export default {
  props: { poprops: Object },
  emits: ["selOrder"],
  data() {
    return {
      // dataList: poDetailProps
    }
  },
  computed: {
    totalAmt() {
      let amt = this.poprops.FREIGHT;
      // console.log(this.poprops.PO_ID);
      for (const item in this.poprops.POD) {
        amt += parseInt(this.poprops.POD[item].QTY) * parseInt(this.poprops.POD[item].UNIT_PRICE);
      }
      return amt;
    }, poStatus() {
      switch (this.poprops.STATUS) {
        case 0: {
          return "訂單已確認";
        }
        case 1: {
          return "訂單備貨中";
        }
        case 2: {
          return "訂單已發貨";
        }
        case 3: {
          return "訂單已完成";
        }
        case 4: {
          return "訂單已取消";
        }
        default: {
          return "請聯繫客服";
        }
      }
    }
  },
  mounted() { //poDetailProps被視為attr的傳進來
  },
  template: `
    <dl class="po-single" @click="$emit('selOrder', poprops.PO_ID)">
      <div>
        <dt class="po-key">購買日期</dt>
        <dd class="po-value">{{poprops.CREATE_DATE}}</dd>
      </div>
      <div>
        <dt class="po-key">主單編號</dt>
        <dd class="po-value">
          <button type="button">
              {{poprops.PO_ID}}
          </button>
        </dd>
      </div>
      <div>
        <dt class="po-key">購買金額</dt>
        <dd class="po-value">TWD$ {{totalAmt}}元</dd>
      </div>
      <div>
        <dt class="po-key">付款方式</dt>
        <dd class="po-value">線上刷卡</dd>
      </div>
      <div>
        <dt class="po-key">訂單狀態</dt>
        <dd class="po-value">{{poStatus}}</dd>
      </div>
    </dl>
  `
}
const invoiceApp = Vue.createApp({
    data() {
        return {
            po: [], member: []
        }
    }, methods: {

    }, created() {
        axios.get("../../php/frontend/issuePO.php")
            .then(res => {
                this.po = res.data[0];
            }).catch(err => console.log("[issue po]", err));
        axios.get("../../php/frontend/memberInfo.php")
            .then(res => {
                this.member = res.data[0];
                // console.log(this.member);
            }).catch(err => console.log("[member info]", err));
    }
}).mount("#invoice");
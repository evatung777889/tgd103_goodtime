const checkoutApp = Vue.createApp({
    data() {
        return {
            itm: [],
            tkt: [],
            checkoutList: [],
            prodAmt: 0, expoAmt: 0, member: [],
            buyName: "", buyTel: "", sameCheck: true, totalAmt: 0
        }
    }, computed: {
        subtotal() {
            let amt = 0;
            this.tkt.forEach(ticket => {
                amt += ticket.EXPO_PRICE * ticket.QTY
            });
            this.itm.forEach(prod => {
                amt += prod.QTY * prod.PRICE
            });
            return amt;
        }
    }
    , methods: {
        ticketType(expoObj) {
            if (expoObj.EXPO_PRICE === expoObj.ADULT_PRICE) {
                return "一般票";
            } else if (expoObj.EXPO_PRICE === expoObj.CONC_PRICE) {
                return "優待票";
            } else { return "團體票"; }
        }, checkout() {
            const itmList = {}, tktList = {};
            console.log(this.tkt);
            this.itm.forEach(itm => {
                const pid = itm.FK_CART_PRODUCT_ID,
                    sid = itm.FK_CART_PRODUCT_SPEC_ID,
                    qty = itm.QTY;
                itmList[pid] = { sid, qty };
            });
            this.tkt.forEach(tkt => {
                const eid = tkt.EXPO_ID,
                    price = tkt.EXPO_PRICE,
                    qty = tkt.QTY;
                tktList[eid] = { price, qty };
            });
            const cart = JSON.stringify(itmList),
                passport = JSON.stringify(tktList);
            // console.log(typeof (cart));
            axios.post("../../php/frontend/checkoutCart.php", cart)
                .then(res => {
                    this.prodAmt = res.data;
                    console.log("[product]", this.prodAmt);
                    axios.post("../../php/frontend/checkoutTkt.php", passport)
                        .then(res => {
                            this.expoAmt = res.data;
                            console.log("[expo]", this.expoAmt);
                            this.totalAmt = parseInt(this.prodAmt) + parseInt(this.expoAmt) + 60;
                            sessionStorage.setItem("payment", this.totalAmt);
                            axios.post("../../php/frontend/money.php", {
                                amt: this.totalAmt,
                                cart: cart,
                                passport: passport
                            }).then(res => {
                                window.location.href = "../html/checkout.html";
                            }).catch(err => { console.log("[pass amt]", err) });
                        }).catch(err => console.log("[checkout ticket]", err));
                }).catch(err => console.log("[checkout cart]", err));
        }, atCheck() {
            this.sameCheck = !this.sameCheck;
            if (!this.sameCheck) {
                this.buyName = this.member.USERNAME;
                this.buyTel = this.member.PHONE;
            } else {
                this.buyName = "";
                this.buyTel = "";
            }
        }
    }, created() {
        let itmList = localStorage.getItem("checkoutItm"),
            tktList = localStorage.getItem("checkoutTkt");
        localStorage.removeItem("checkoutItm");
        localStorage.removeItem("checkoutTkt");
        if (itmList) {
            itmList = JSON.parse(itmList);
            this.itm = [...itmList];
            if (tktList) {
                tktList = JSON.parse(tktList);
                this.tkt = [...tktList];
            }
        } else if (tktList) {
            tktList = JSON.parse(tktList);
            this.tkt = [...tktList];
        }
        axios.get("../../php/frontend/memberInfo.php")
            .then(res => {
                this.member = res.data[0];
                // console.log(this.member);
            }).catch(err => console.log("[member info]", err));
    }
}).mount("#checkout");
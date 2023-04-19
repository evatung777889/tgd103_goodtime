const eventDetailApp = Vue.createApp({
    data() {
        return {
            eventDetail: {},
            orderQty: 1,
            price: 0
        }
    },
    methods: {
        selectValue(e) { // 印出票價
            this.price = e.target.value;
            console.log(this.price);
        },
        passToCart() { // 加入購物車
            if (this.price != 0) {
                // console.log(`eid=${this.eventDetail.ID}&buyQty=${this.orderQty}&price=${this.price}`);
                axios.post("../../php/frontend/ticketAdd.php",
                    `eid=${this.eventDetail.ID}&buyQty=${this.orderQty}&price=${this.price}`)
                    .then(res => {
                        if (res.status === 200) {
                            // console.log(res);
                            window.location.href = "../html/shopping_cart01.html";
                        }
                    })
                    .catch(err => console.log("[cart add]", err));
            }
        }
    },
    created() {
        axios.get("../../php/frontend/expo.php" + window.location.search)
            .then(res => { // 拿商品頁的資料
                // console.log(window.location.search);
                this.eventDetail = res.data[0];
                console.log(this.eventDetail);
                this.price = this.eventDetail.ADULT_PRICE
            }).catch(err => console.log("[expo info]", err));
    }
}).mount("#eventDetail");









// $(function() {
//     // This button will increment the value
//     $('.qtyplus').click(function(e) {
//         // Stop acting like a button
//         e.preventDefault();
//         // Get the field name
//         fieldName = $(this).attr('field');
//         // Get its current value
//         var currentVal = parseInt($('input[name=' + fieldName + ']').val());
//         // If is not undefined
//         if (!isNaN(currentVal)) {
//         // Increment
//         $('input[name=' + fieldName + ']').val(currentVal + 1);
//         } else {
//         // Otherwise put a 0 there
//         $('input[name=' + fieldName + ']').val(0);
//         }
//     });
//     // This button will decrement the value till 0
//     $(".qtyminus").click(function(e) {
//         // Stop acting like a button
//         e.preventDefault();
//         // Get the field name
//         fieldName = $(this).attr('field');
//         // Get its current value
//         var currentVal = parseInt($('input[name=' + fieldName + ']').val());
//         // If it isn't undefined or its greater than 0
//         if (!isNaN(currentVal) && currentVal > 0) {
//         // Decrement one
//         $('input[name=' + fieldName + ']').val(currentVal - 1);
//         } else {
//         // Otherwise put a 0 there
//         $('input[name=' + fieldName + ']').val(0);
//         }
//     });
// });


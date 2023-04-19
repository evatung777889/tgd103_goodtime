const productDetailApp = Vue.createApp({
    data() {
        return {
            productDetail: {},
            orderQty: 1,
            spec: 0,
            idarr: ""
        }
    }, methods: {
        selectSpec(e) {
            this.spec = e.target.id;
            // console.log(this.spec);
        },
        passToCart() { // 加入購物車
            if (this.spec != 0) { // 
                axios.post("../../php/frontend/cartAdd.php",
                    `pid=${this.productDetail.ID}&buyQty=${this.orderQty}&spec=${this.spec}`)
                    .then(res => {
                        if (res.status === 200) {
                            console.log(res);
                            window.open("../html/shopping_cart01.html");
                            console.log(this.productDetail.ID);
                        }
                    })
                    .catch(err => console.log("[cart add]", err));
            }
        },
        geturl(){
            let urlParams = new URLSearchParams(window.location.search);
            let getid = urlParams.get("ID");
            this.idarr = getid;
            console.log(this.idarr);
        }
    }, created() {
        axios.get("../../php/frontend/product.php" + window.location.search)
            .then(res => { // 拿商品頁的資料
                console.log(window.location.search);
                this.productDetail = res.data[0];
                this.productDetail.FEATURED = this.productDetail.FEATURED.split(",");
                this.productDetail.path = this.productDetail.path.split(",");
                this.productDetail.path = [...new Set(this.productDetail.path)];
                this.productDetail.SELECTED = this.productDetail.SELECTED.split(",");
                this.productDetail.SELECTED = [...new Set(this.productDetail.SELECTED)];
                this.productDetail.SID = this.productDetail.SID.split(",");
                this.productDetail.SID = [...new Set(this.productDetail.SID)];
                this.productDetail.specList = {};
                this.productDetail.SID.forEach((ele, idx) => {
                    this.productDetail.specList[ele] = this.productDetail.SELECTED[idx];
                });
            }).catch(err => console.log("[product info]", err));
    }, mounted(){
        this.geturl();
    }
}).mount("#productDetail");

function change_img(li_img) {
    let pic = li_img.src; //取得當下被點擊的圖片的src
    // console.log(pic); //測試
    const slider_img = document.querySelector("#slider"); //取得slider中img物件
    slider_img.style.backgroundImage = `url('${pic}')`; //將slider中img物件的src改為點擊圖片的src
}
function choose() {
    // console.log("aaa");
    $(".button-unfocus").addClass(".button-focus");
}

// 重寫
// $(function () {
//   // This button will increment the value
//   $(".qtyplus").click(function (e) {
//     // Stop acting like a button
//     e.preventDefault();
//     // Get the field name
//     fieldName = $(this).attr("field");
//     // Get its current value
//     var currentVal = parseInt($("input[name=" + fieldName + "]").val());
//     // If is not undefined
//     if (!isNaN(currentVal)) {
//       // Increment
//       $("input[name=" + fieldName + "]").val(currentVal + 1);
//     } else {
//       // Otherwise put a 0 there
//       $("input[name=" + fieldName + "]").val(0);
//     }
//   });
//   // This button will decrement the value till 0
//   $(".qtyminus").click(function (e) {
//     // Stop acting like a button
//     e.preventDefault();
//     // Get the field name
//     fieldName = $(this).attr("field");
//     // Get its current value
//     var currentVal = parseInt($("input[name=" + fieldName + "]").val());
//     // If it isn't undefined or its greater than 0
//     if (!isNaN(currentVal) && currentVal > 0) {
//       // Decrement one
//       $("input[name=" + fieldName + "]").val(currentVal - 1);
//     } else {
//       // Otherwise put a 0 there
//       $("input[name=" + fieldName + "]").val(0);
//     }
//   });
// });

//點擊商品介紹滑動到對應位置

$(function () {
    // 偵聽a click
    $(".switch-btnbox div").bind("click", function () {

        const sid = this.dataset.sid;
        // console.log(sid);
        // 取得目標區塊的y座標
        const header = document.querySelector("div.top-area");
        const top = document.getElementById("item-" + sid).offsetTop - header.offsetHeight;

        window.scrollTo({ top: top, behavior: "smooth" });
        // // 取得body物件 這種寫法在各瀏覽器上最保險
        // var $body = window.opera
        //     ? document.compatMode == "CSS1Compat"
        //         ? $("html")
        //         : $("body")
        //     : $("html,body");
        // // 移動捲軸有動畫效果
        // $body.animate(
        //     {
        //         scrollTop: target_top
        //     },
        //     800
        // );
    });
});

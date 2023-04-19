$(() => {
    $("#header").load("topbar.html");
    $("#footer").load("footer.html");
  });

  $(function () {
    // 偵聽a click
    $(".nav-block div").bind("click", function () {
      var id = $(this).attr("data-id");

      // 取得目標區塊的y座標
      var target_top = $("#area" + id).offset().top - 100;

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

  /* 標籤-active切換 */

$(".nav-block").on("click", function () {
    $(this).closest(".nav-ctn").find(".title").removeClass("-active");
    console.log($(this).find(".title"));
    $(this).find(".title").addClass("-active");
  });
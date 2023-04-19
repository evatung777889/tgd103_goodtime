
const navLinkList = document.querySelectorAll(
    ".anchor-box li a.scrollDetectorJS"
  ),
  header = document.querySelector("div.top-area"),
  navigationTable = [];
window.addEventListener("scroll", () => {
  navLinkList.forEach((link) => {
    const sid = link.dataset.scroll,
      section = document.getElementById(sid),
      top = section.offsetTop, // 元素在window上的頂部像素
      bottom = section.offsetHeight + top, // 元素的高度像素
      navLink = {
        section,
        link,
        top,
        bottom,
      };
    navigationTable.push(navLink);
  });
  const y = window.scrollY + header.offsetHeight;
  navigationTable.forEach((navLink, idx) => {
    if (idx === navigationTable.length) {
      const link = navLink.link,
        top = navLink.top,
        bottom = navigationTable[idx + 1].top;
      if (y >= top && y < bottom) {
        link.classList.add("scrollIn");
      } else {
        link.classList.remove("scrollIn");
      }
    } else {
      const link = navLink.link,
        top = navLink.top,
        bottom = navLink.bottom;
      if (y >= top && y < bottom) {
        link.classList.add("scrollIn");
      } else {
        link.classList.remove("scrollIn");
      }
    }
  });
});
// const a_news = document.querySelector('.a-news');
// const a_events = document.querySelector('.a-events');
// const a_aboutus = document.querySelector('.a-aboutus');
// const a_shops = document.querySelector('.a-shops');

// a_news.addEventListener("click", function () {
//     const element = document.getElementById('anchor1');
//     element.scrollIntoView(true);
//     element.scrollIntoView({ behavior: 'smooth' });
// });

// // a_events.addEventListener("click", function(){
// //     document.querySelector('#anchor2').scrollIntoView(true);
// // })

// a_aboutus.addEventListener("click", function () {
//     document.querySelector('#anchor3').scrollIntoView(true);
//     console.log('t');
//     function test() {
//         window.scrollBy(0, -100);
//     }
//     test();
//     console.log('tt');
// })

// a_shops.addEventListener("click", function () {
//     document.querySelector('#anchor4').scrollIntoView(true);
//     window.scrollBy(0, -100);

// })

// console.log("[navDomList]" , navDomList);
// const navTable ={};
// for (const a of navDomList){
//     console.log(a.dataset);
//     console.log(a.id);
// }

const topbarApp = Vue.createApp({
  data() {
    return {
      login: "0", //出現
      styleObject: {
        right: "-98px",
        height: "50px",
      },
    };
  },
  mounted() {
    console.log("mounted");
    this.login = sessionStorage.getItem("login");
  },
  methods: {
    // 进入元素
    mouseenter() {
      // console.log("mouseenter",this.login);
      if (this.login === "1") {
        this.styleObject.right = "0px";
        this.styleObject.height = "125px";
      }
    },
    // 离开元素
    mouseleave() {
      //   console.log("mouseleave");
      this.styleObject.right = "-98px";
      this.styleObject.height = "50px";
    },
    log() {
      if (sessionStorage.getItem("login") === "1") {
        window.location.href = "../html/memberCenter.html";
      }else{
        window.location.href = "../html/log_in.html";
      }
    },
    log_phone() {
      if (sessionStorage.getItem("login") === "1") {
        window.location.href = "#";
      }else{
        window.location.href = "../html/log_in.html";
      }
    },
    logOut() {
      sessionStorage.removeItem("login");
      alert("登出成功");
      window.location.href = "../html/log_in.html";
    },
  },
}).mount(".member-icon-box-out");



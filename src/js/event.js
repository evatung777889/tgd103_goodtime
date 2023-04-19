const eventApp = Vue.createApp({
    data() {
        return {
            current: 1,    
            paginate: 4,  
            paginate_total: 0, //總筆數
            eventList: [],
            // fakeEvtList: [
            //     // {
            //     //     ID: 1,
            //     //     MAIN_PHOTO: "../img/event/event1.png",
            //     //     TAG1: "插畫特展",
            //     //     TAG2: "插畫明信片",
            //     //     TITLE: "《Lindsayooo》新興畫家特展",
            //     //     START_DATE: "2023-01-15",
            //     //     END_DATE: "2023-01-31"
            //     // }, {
            //     //     ID: 2,
            //     //     MAIN_PHOTO: "../img/event/event2.png",
            //     //     TAG1: "活動特展",
            //     //     TAG2: "人氣喜餅",
            //     //     TITLE: "《國際婚紗展》2023台北國際婚紗展",
            //     //     START_DATE: "2023-01-16",
            //     //     END_DATE: "2023-02-21"
            //     // }, {
            //     //     ID: 3,
            //     //     MAIN_PHOTO: "../img/event/event3.png",
            //     //     TAG1: "吉卜力特展",
            //     //     TAG2: "波妞造型手做麻糬",
            //     //     TITLE: "《崖下的波妞》十周年特展",
            //     //     START_DATE: "2023-01-06",
            //     //     END_DATE: "2023-03-31"
            //     // }, {
            //     //     ID: 4,
            //     //     MAIN_PHOTO: "../img/event/event4.png",
            //     //     TAG1: "電影特展",
            //     //     TAG2: "台灣限定明信片",
            //     //     TITLE: "《新海城》童話特展",
            //     //     START_DATE: "2023-01-16",
            //     //     END_DATE: "2023-02-28"
            //     // }, {
            //     //     ID: 5,
            //     //     MAIN_PHOTO: "../img/event/event5.png",
            //     //     TAG1: "插畫特展",
            //     //     TAG2: "台灣限定週邊絲巾",
            //     //     TITLE: "《ヒグチユウコ》台灣限定特展",
            //     //     START_DATE: "2023-02-01",
            //     //     END_DATE: "2023-03-01"
            //     // }, {
            //     //     ID: 6,
            //     //     MAIN_PHOTO: "../img/event/event6.png",
            //     //     TAG1: "名匠特展",
            //     //     TAG2: "原稿明信片",
            //     //     TITLE: "《再見梵谷》光影體驗展",
            //     //     START_DATE: "2023-01-26",
            //     //     END_DATE: "2023-03-31"
            //     // }, {
            //     //     ID: 7,
            //     //     MAIN_PHOTO: "../img/event/event7.png",
            //     //     TAG1: "國際電玩展",
            //     //     TAG2: "限定紀念品",
            //     //     TITLE: "《Game Show》台北國際電玩展",
            //     //     START_DATE: "2023-02-01",
            //     //     END_DATE: "2023-02-08"
            //     // }, {
            //     //     ID: 8,
            //     //     MAIN_PHOTO: "../img/event/event8.png",
            //     //     TAG1: "神話特展",
            //     //     TAG2: "中古明信片",
            //     //     TITLE: "《諸神黃昏》北歐神話特展",
            //     //     START_DATE: "2023-01-31",
            //     //     END_DATE: "2023-02-23"
            //     // }, {
            //     //     ID: 9,
            //     //     MAIN_PHOTO: "../img/event/event9.png",
            //     //     TAG1: "多媒體特展",
            //     //     TAG2: "限定印章",
            //     //     TITLE: "《流體藝術》暈染雙人流體畫展",
            //     //     START_DATE: "2023-02-02",
            //     //     END_DATE: "2023-02-28"
            //     // }, {
            //     //     ID: 10,
            //     //     MAIN_PHOTO: "../img/event/event10.png",
            //     //     TAG1: "瓷器特展",
            //     //     TAG2: "獨家小瓷器",
            //     //     TITLE: "《名窯瓷器》琺瑯彩瓷特展",
            //     //     START_DATE: "2023-02-05",
            //     //     END_DATE: "2023-02-15"
            //     // }, {
            //     //     ID: 11,
            //     //     MAIN_PHOTO: "../img/event/event11.png",
            //     //     TAG1: "攝影特展",
            //     //     TAG2: "微型紀念品",
            //     //     TITLE: "《微縮人生》微型展的奇幻世界",
            //     //     START_DATE: "2023-02-16",
            //     //     END_DATE: "2023-03-31"
            //     // }, {
            //     //     ID: 12,
            //     //     MAIN_PHOTO: "../img/event/event12.png",
            //     //     TAG1: "美食特展",
            //     //     TAG2: "各國美食",
            //     //     TITLE: "《美食饗味》2023台灣國際美食展",
            //     //     START_DATE: "2023-02-16",
            //     //     END_DATE: "2023-02-28"
            //     // },
                
            // ]
        }
    },mounted(){
        
    },
      updated(){
        this.updatePaginate();
    },methods: {
        setPaginate(i) {
            console.log(i);
            if (this.current == 1) {
              return i < this.paginate;  // i小於4筆資料(ture)則回傳
            } else {
      
              return (
                i >= this.paginate * (this.current - 1) &&  //i大於當於4筆*當前頁數-1
                i < this.current * this.paginate   // i小於1頁
              );
            }  
            
          },
          updateCurrent(i) {
            this.current = i;  
            console.log(this.current = i);
          },
          updatePaginate() {
            this.paginate_total = Math.ceil(
            document.querySelectorAll(".eventshow li").length / this.paginate
            );
            console.log(Math.ceil(document.querySelectorAll(".eventshow li").length / this.paginate));
            // console.log(this.currentList);
          }
        
    }, 
    created() {
        axios.get("../../php/frontend/eventList.php")
            .then(res => { // 拿今天進行中展演展覽的資料
                this.eventList = [...res.data];
                // console.log(this.eventList);
            })
            .catch(err => console.log("[event list]", err));
    }
}).mount("#eventApp");
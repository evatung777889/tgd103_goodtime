const newApp = Vue.createApp({
  data() {
    return {
      current: 1,    //設定要顯示的頁數:1頁
      paginate: 4,  //每頁要顯示4筆資料
      paginate_total: 0, //總筆數
      status_filter: "",
      currentList: [], //接不同三個universe的空陣列
      tabpanels:[]
    };
  },
  mounted(){
    this.setStatus("");
  },
  updated(){
    this.updatePaginate();
  },
  methods: {
    setPaginate(i) {
      // console.log(i);
      if (this.current == 1) {
        return i < this.paginate;  // i小於4筆資料(ture)則回傳
      } else {

        return (
          i >= this.paginate * (this.current - 1) &&  //i大於當於4筆*當前頁數-1
          i < this.current * this.paginate   // i小於1頁
        );
      }  
      
    },
    setStatus(status) {
      this.status_filter = status;
      console.log(status);
      if (this.status_filter == "") {
        this.currentList = this.tabpanels;
      }else{
        // console.log(this.currentList);
        // this.currentList = [];
        axios.get("../../php/frontend/new.php")
        .then(res => {
          this.currentList = {...res.data};
          //脫掉第一層{}
          let value = Object.values(this.currentList);
          console.log(value);
          
          this.currentList = value.filter((news) => {
            return news.DESC == this.status_filter;
          });
          console.log(this.currentList);
          this.updateCurrent(1);
        })
        
        this.currentList = this.currentList.filter((news) => {
            return news.DESC == this.status_filter;
        });
      }
      //  console.log(this.status_filter);
      // console.log(this.currentList);
    },
    updateCurrent(i) {
      this.current = i;  
      // console.log(this.current = i);
    },
    updatePaginate() {
      this.paginate_total = Math.ceil(
      document.querySelectorAll(".tab-panel li").length / this.paginate
      );
      // console.log(Math.ceil(document.querySelectorAll(".tab-panel li").length / this.paginate));
      // console.log(this.currentList);
    }
  },
  beforeCreate(){
    axios.get("../../php/frontend/new.php")
    .then(res => {
      this.currentList = {...res.data};
      // console.log(this.currentList);
      // this.tabpanels=JSON.parse(JSON.stringify(this.currentList.news));
      // console.log(this.tabpanels);
    }).catch(err => {
      console.log(err);
    });
  }
}).mount("#news");

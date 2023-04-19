
const storeApp = Vue.createApp({
    data(){
        return{
            storeFilter:"",
            currentFilter: 'ALL',
            currentList:[],
            storeList:[]
        };
    },
    mounted(){
    },
    updated(){
        console.log(`TTT`);
    },
    computed:{
        
    },
    watch:{
        
    },
    methods:{
        all(){
                axios.get("../../php/frontend/store.php")
                .then(res => { // 拿今天進行中展演展覽的資料
                        this.storeList = [...res.data];
                        // console.log(this.storeList);
                    })
                    .catch(err => console.log("[store list]", err));        
        },
        // ==== 篩選 ====
        filter(status){
                this.status_filter = status;
                console.log(status);
                console.log(this.storeList);
                axios.get("../../php/frontend/store.php")
                .then(res => { // 拿今天進行中展演展覽的資料
                        this.storeList = [...res.data];
                        console.log(this.storeList);

                        let value = Object.values(this.storeList);
                        console.log(value);
              
                        this.storeList = value.filter((store) => {
                                return store.TAG1 == this.status_filter;
                        });

                })
        },
        type(){
                let select = document.querySelector("#event-type");
                const switchValue = select.options[select.selectedIndex].value;
                console.log(switchValue);
                let i = switchValue;
                if(switchValue == "1"){
                        axios.get("../../php/frontend/store.php")
                        .then(res => { // 拿今天進行中展演展覽的資料
                                this.storeList = [...res.data];
                                console.log(this.storeList);
                                
                        })
                        .catch(err => console.log("[store list]", err));         
                }else if(switchValue == i){
                        axios.get("../../php/frontend/store.php")
                        .then(res => { // 拿今天進行中展演展覽的資料
                                this.storeList = [...res.data];
                                console.log(this.storeList);
        
                                let value = Object.values(this.storeList);
                                console.log(value);
                      
                                this.storeList = value.filter((store) => {
                                        return store.TAG2 == i;
                                });
        
                        })  
                }    
        }
    },
    created() {
        
        axios.get("../../php/frontend/store.php")
        .then(res => { // 拿今天進行中展演展覽的資料
                this.storeList = [...res.data];
                // console.log(this.storeList);
            })
            .catch(err => console.log("[store list]", err));
            
    }
}).mount("#store");


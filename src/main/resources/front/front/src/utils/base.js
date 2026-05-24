const base = {
    get() {
        return {
            url : "http://localhost:8080/spacetourismhub/",
            name: "spacetourismhub",
            // 退出到首页链接
            indexUrl: 'http://localhost:8080/spacetourismhub/front/dist/index.html'
        };
    },
    getProjectName(){
        return {
            projectName: "星际旅游信息网"
        } 
    }
}
export default base

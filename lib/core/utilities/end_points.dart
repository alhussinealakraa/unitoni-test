abstract class EndPoints {


  static String getNews(String keyWord) =>
      '/v2/top-headlines?sources=$keyWord&apiKey=API_KEY';

}

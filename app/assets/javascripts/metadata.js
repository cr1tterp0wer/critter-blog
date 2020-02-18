/* 
 * Loads up the Open Tag graph tags
 * for facebook
 */

document.addEventListener("turbolinks:load",function() {

  //
  //Checks if client lands on Post page
  //
  function isPostUrl(){
    let path = window.location.pathname;
    return ( path.substring(1).split("/").length > 1 );
  }

  //
  // Builds Open Graph JSON
  //
  // <meta property="og:title" content="The Rock" />
  // <meta property="og:type" content="video.movie" />
  // <meta property="og:url" content="http://www.imdb.com/title/tt0117500/" />
  // <meta property="og:image" content="http://ia.media-imdb.com/images/rock.jpg" />
  // <meta property="og:description" content="Can You Smell What The Rock Is Cooking?" />
  //
  function buildMetaDataJSON(){
    let ogData = {};

    ogData.title = $("#post-title").text().trim();
    ogData.url   = window.location.href;
    ogData.image = $('#cover-picture')[0].src;
    ogData.description = $('#post-body').text().trim();

    return ogData;
  }

  function insertMetaData( data ){
    $('head').append('<meta property="og:title" content="'+data.title+'">');
    $('head').append('<meta property="og:url" content="'+data.url+'">');
    $('head').append('<meta property="og:image" content="'+data.image+'">');
    $('head').append('<meta property="og:description" content="'+data.description+'">');
  }

  function buildAndInsertMetaData(){

    let metaData = {}

    if( isPostUrl() ){
      metaData = buildMetaDataJSON();
    }else{
      //Insert generic meta data
      metaData.title = "Christopher Apodaca";
      metaData.url   = "https://www.christopher-apodaca.com";
      metaData.image = "https://christopher-apodaca.herokuapp.com/assets/profile-sm-e99a5663a1f8f397cb447c87eba2463d513daba8b77f94101ed42677ae2a2311.jpg"
      metaData.description = "I am experienced in leveraging agile frameworks to " + 
                    "provide a robust synopsis for high level overviews."+
                    "Iterative approaches to corporate strategy foster " +
                    "collaborative thinking to further the overall value" +
                    " proposition." 
    }

    insertMetaData( metaData );
  }

  buildAndInsertMetaData();

});

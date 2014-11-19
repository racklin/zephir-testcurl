namespace Testcurl;

%{

#include <stdio.h>
#include <curl/curl.h>

}%

class Simple
{
    public static function version() -> string
    {
        string ver="";
        %{
            ZVAL_STRING(ver, curl_version(), 1);
        }%
        return ver;
    }


    public static function getUrlContent(string! url)
    {
        %{
            CURL *curl;
            CURLcode res;
   
            curl = curl_easy_init();
            if(curl) {
              curl_easy_setopt(curl, CURLOPT_URL, Z_STRVAL_P(url));
              curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);
   
              res = curl_easy_perform(curl);
   
              curl_easy_cleanup(curl);
            }
        }%
    }

}

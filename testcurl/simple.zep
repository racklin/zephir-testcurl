namespace Testcurl;

%{

#include <stdio.h>
#include <curl/curl.h>

}%

class Simple
{
    public function version() -> string
    {
        string ver="";
        %{
            ZVAL_STRING(ver, curl_version(), 1);
        }%
        return ver;
    }

}

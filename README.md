# Powershell-URL-Decoder

$str = "%3c%68%74%6d%6c%20%64%69%72%3d%22%6c%74%72%22%20%6c%61%6e%67%3d%22%65"

$str | Invoke-UrlDecode
Invoke-UrlDecode -EncodedString $str -Verbose


Vim�UnDo� u��C���Dm�����N=Cv\�V���S#d�2�   Z                  	       	   	   	    b���    _�                             ����                                                                                                                                                                                                                                                                                                                                                  V        b�Ҳ     �                =======   namespace WsGateway\Services;   5>>>>>>> 1b812be (First commit get pdv info spma Tigo)5��                          :       \               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        b�ҳ     �                <<<<<<< HEAD5��                                                5�_�                    	        ����                                                                                                                                                                                                                                                                                                                            	           
           V        b�ҷ     �      	          =======   5>>>>>>> 1b812be (First commit get pdv info spma Tigo)5��                          �       >               5�_�                            ����                                                                                                                                                                                                                                                                                                                            	           	           V        b�ҷ     �                <<<<<<< HEAD5��                          b                      5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        b�Һ     �                <<<<<<< HEAD5��                                               5�_�                    W        ����                                                                                                                                                                                                                                                                                                                            k           W           V        b���    �   V   W          =======   R        $this->url = config('webservices.rest.spmaTigo.' .env('SPMATIGO','prod'));       }           public function getPdvNew()       {           try {   M            $response = \HttpClient::post($this->url . '/api/pos/get-pdv/', [   "                'form_params' => [   #                    'from' => 'dev'                   ]               ]);   7            $log = $response->getBody()->getContents();   +            $result = $response->getBody();   L            $data = ['status' => 1, 'result' => $result, 'message' => $log];               return $data;       !        } catch (\Exception $e) {   j            Log::error("Error exception spmaTigo service get pdv new: ", ['message' => $e->getMessage()]);               return false;   5>>>>>>> 1b812be (First commit get pdv info spma Tigo)5��    V                      �      �              5�_�                            ����                                                                                                                                                                                                                                                                                                                            W           W           V        b���     �               Z   <?php   &namespace WsGateway\Services\SpmaTigo;           use DB;   *use GuzzleHttp\Exception\RequestException;   .use GuzzleHttp\Exception\BadResponseException;   use HttpClient;   use Log;       class SpmaTigoService   {           protected $url;       !    public function __construct()       {   W        $this->url = config('webservices.rest.spmaTigo.' .env('SPMA_URL_TIGO','prod'));       }       %    public function getPdvNew($param)       {           try {   L            $header=['username' => config('webservices.rest.spmaTigo.user'),   m                'password' => config('webservices.rest.spmaTigo.pass'),'Content-Type' => 'application/json'];       M            $response = \HttpClient::post($this->url . '/api/pos/get-pdv/', [   3                "body"      => json_encode($param),   &                "headers"   => $header               ]);       H            $content = json_decode($response->getBody()->getContents());   K            #Log::info('spmaTigoService',['response' => $content->result]);                   return [   :                "status"    => $response->getStatusCode(),   2                "result"      => $content->result,   7                "header"     => $response->getHeaders()               ];       ,        } catch (\BadResponseException $e) {   k            Log::error("Error exception spmaTigo service get pdv new: ", ['message' => $e->getResponse()]);   )            $request = $e->getResponse();                if(isset($request)){   H                $body = json_decode($request->getBody()->getContents());   N                $message_body = isset($body->message) ? $body->message : null;               }   $            switch ($e->getCode()) {                   case 400:                        $message = [   )                        "status"    => 0,   |                        "message"   => isset($message_body) ? $message_body : "Error en la operación, intente nuevamente.",   +                        "result"    => null                       ];                       break;                   case 409:                        $message = [   )                        "status"    => 0,   `                        "message"   => isset($message_body) ? $message_body : "Token Expirado.",   +                        "result"    => null                       ];                       break;                   case 500:                        $message = [   )                        "status"    => 0,   A                        "message"   => "Error en la operación.",   +                        "result"    => null                       ];                       break;                   case 401:                        $message = [   )                        "status"    => 0,   j                        "message"   => isset($message_body) ? $message_body : "Credenciales incorrectas.",   +                        "result"    => null                       ];                       break;                   default:   0                    $message = $e->getMessage();                       break;               }                   return [   -                "status"    => $e->getCode(),   (                "body"      => $message,   !                "token"     => ""               ];   	        }           }   }5�5�_�      	                      ����                                                                                                                                                                                                                                                                                                                            $                      V        b���     �             
   =======       M            $response = \HttpClient::post($this->url . '/api/pos/get-pdv/', [   3                "body"      => json_encode($param),   &                "headers"   => $header               ]);   N            Log::info('spmaTigoService',['response' => $response->getBody()]);                   return $response;   1>>>>>>> b6c598a (Test Services customer spmaTigo)5��           
               b      b              5�_�                  	           ����                                                                                                                                                                                                                                                                                                                                                  V        b���    �                <<<<<<< HEAD5��                          U                     5��
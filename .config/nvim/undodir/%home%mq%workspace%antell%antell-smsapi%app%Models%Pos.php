Vim�UnDo� ǽ̹g���؛�cs,<'�jǺ�7a���   &                                   b��    _�                             ����                                                                                                                                                                                                                                                                                                                                                  V        b���     �                =======   a    protected $fillable = ["latitude", "longitude", "epin_id","msisdn","client_id","circuit_id"];   2>>>>>>> 2ab4acf (Save update pdv and pos services)5��                          "      �               5�_�                    
        ����                                                                                                                                                                                                                                                                                                                                                  V        b���    �   	   
          <<<<<<< HEAD5��    	                      �                      5�_�                    
        ����                                                                                                                                                                                                                                                                                                                                                  V        b��     �               &   <?php       namespace WsGateway\Models;       'use Illuminate\Database\Eloquent\Model;       class Pos extends Model   {       protected $table = 'pos';   k    protected $fillable = ["latitude", "longitude", "epin_id","msisdn","client_id","circuit_id","password",   "        "children", "pos_parent"];             public function client()     {   7    return $this->belongsTo('WsGateway\Models\Client');     }   !  public function getDateFormat()     {       return 'Y-m-d H:i:s.u';     }         public function bankConfig()     {   ,    return $this->hasOne(BankConfig::class);     }           (  public function checkPendingPayments()     {   �    $tarex = \DB::table('pos_bank_credit')->wherePosId($this->id)->where('bank_transaction', '>', 0)->wherePaymentTransaction(-1)         ->count();   �    $giros = \DB::table('pos_giros_credit')->wherePosId($this->id)->where('bank_transaction', '>', 0)->wherePaymentTransaction(-1)         ->count();   `    $bill_payments = BillPaymentCredits::wherePosId($this->id)->whereStatus('for_pay')->count();   2    return ($tarex + $giros + $bill_payments) > 0;     }   }5�5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        b��     �                =======   l    protected $fillable = ["latitude", "longitude", "epin_id","msisdn","client_id","circuit_id","password"];   >>>>>>> 6846601 (Fix command)5��                          "      �               5�_�                     
        ����                                                                                                                                                                                                                                                                                                                                                  V        b��    �   	   
          <<<<<<< HEAD5��    	                      �                      5��
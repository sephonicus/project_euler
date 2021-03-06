### Problem 48: Self powers

# The series, 11 + 22 + 33 + ... + 1010 = 10405071317.

# Find the last ten digits of the series, 11 + 22 + 33 + ... + 10001000.

### Solution:

(1..1000).to_a.map { |i| i ** i }.inject(&:+)

# 100036819914469517709537501122764679556779368062293465458376098810023491074771
# 619438142865909952784594586994264319129089472034297990640767964725986043423846
# 803832604080969103761537037623771364851006311573295146177424670558426686575960
# 181584366644283228455688031311454815153919097539848549664557651346585858271233
# 640116622195618817344953167410268890832176466302030669977040862534076609159502
# 279137936809836930637560281385664635877375155877521346022579657984658333400734
# 935862434233933298133457123788880928310334876026136017595081560917946402687100
# 524365210998086355214201424290343406856093657323107934219403186441391810123815
# 105650926739351576039284247250139159407346300152184381107376702171102630750469
# 573346789782186690664846982834660741296739580179779168360983472243224195284535
# 256468186824036956956619282555532355807806199752768998384886337478678933158156
# 525205917261433942460098614325923316758337107036262555453185205416611714885822
# 950858158961433759446327755438051838092130121883632710223140733220110974010258
# 021646929833176692061964608379073280762736061442808517156500628972850868896422
# 679964719258292405858953075067457838536556187855958968575622569234891474692281
# 091391561983475411764835803581412867029415856566994208773628639094224154722601
# 500447133063011307204270428890504214262819377191859457430220214720118848634591
# 319083375230747696601054742392887106311878302603638131903905200825207205793366
# 671291894623331279369709407422418787204597097644430924278218773832025749008082
# 433007499169869823956112581112760786390035522173784669056770734407449414526666
# 210383981284021630344847691395707235573271662709837224522304679291974725911315
# 742582406485833141540094327821304295463505357404520998451222126424190355017841
# 682455141254863759000777908253928824775165356689988274959440589510258798553952
# 770949351004954644542726561747839910718823868177121590423411939224748975107908
# 594805594509880561796372292846955426378221762516042800822884555254034449486019
# 526711518709222776619575390721112664615014061474423397476527347561996431185285
# 861416781966834012473048771016200679352998575882065367727437956331349545452663
# 271872348233949482575982107640169431604345651211793793545646352146302119772669
# 498355892913235757618859497751663073421286386945616420552553676731129813718251
# 149464946366307375921921305682356166777609373942574288393071260996216346408803
# 882656913203216069263720618308594298797368458427649178484311547207790040169259
# 569411927355351102599126544603936628892174358133320008371710524117150460688354
# 341886202404755217705526342446950129890590193815824593863369410502481516667981
# 368915666834119771347509438990488712679446890189385047505001120522574245555562
# 575056021323038791033798395033324502065323898911550701388295627776388079568721
# 085719649389314265671310596627542214460598805893960060360422692140140209651929
# 425048867029798339635327946045314237554226788198919748178978067895509376319365
# 860369089847482697690654447397801745572036792998179602304178585262679727128346
# 5789498383642350667978127819110846700

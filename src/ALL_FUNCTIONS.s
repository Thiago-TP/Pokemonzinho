.data
TempBuffer:	.space 512


.text
.include "../functions/phases/OAKS_LAB.s"
.include "../functions/phases/ROUTE_1.s"
.include "../functions/phases/GYM.s"
.include "../functions/phases/END_SCREEN.s"
.include "../functions/phases/DIALOGUE.s"
.include "../functions/phases/Musica.s"
.include "../functions/phases/SETUP_GAME.s"
.include "../functions/phases/SetupMenu.s"

.include "../functions/animations/AnimaHero.s"
.include "../functions/animations/AtualizaEstadoHero.s"
.include "../functions/animations/AtualizaPoseHero.s"
.include "../functions/animations/AnimaOak.s"
.include "../functions/animations/AtualizaPoseOak.s"
.include "../functions/animations/CUTSCENE.s"

.include "../functions/prints/ByteCinza.s"
.include "../functions/prints/FETCH_TILE.s"
.include "../functions/prints/EscolheInicial.s"
.include "../functions/prints/EscondeSprite.s"
.include "../functions/prints/GuardaFundo.s"
.include "../functions/prints/ImprimeFundo.s"
.include "../functions/prints/PRINT.s"
.include "../functions/prints/PRINT_CHAR.s"
.include "../functions/prints/PRINT_INT.s"
.include "../functions/prints/PRINT_INVERSEH.s"
.include "../functions/prints/PRINT_INVERSEHV.s"
.include "../functions/prints/PRINT_INVERSEV.s"
.include "../functions/prints/PRINT_TRANSPOSE.s"
.include "../functions/prints/PRINT_TRANSPOSEH.s"
.include "../functions/prints/PRINT_STRING.s"
.include "../functions/prints/PRINT_TILEMAP.s"

.include "../functions/misc/INITIALIZE_MACROS.s"
.include "../functions/misc/Sleep_with_music.s"
.include "../functions/misc/Sleep.s"
.include "../functions/misc/VerificaColisao.s"

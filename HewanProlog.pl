/* Padmavati Tanuwijaya 2023 */

mulai :- menebak(Hewan),
       write('Saya kira hewan tersebut adalah: '),
       write(Hewan), nl,
       batalkan.

/* hipotesis yang akan diuji */
menebak(capybara) :- capybara, !.
menebak(panda) :- panda, !.
menebak(red_panda) :- red_panda, !.
menebak(merak) :- merak, !.
menebak(pinguin) :- pinguin, !.
menebak(gajah) :- gajah, !.
menebak(cupang) :- cupang, !.
menebak(marmut) :- marmut, !.
menebak(pika) :- pika, !.
menebak(klipspringer) :- klipspringer, !.
menebak(musang) :- musang, !.
menebak(tidak_diketahui). /* tidak ada diagnosis */

/* aturan identifikasi hewan */
capybara :- mamalia, herbivora,
    verifikasi(memiliki_bulu_cokelat),
    verifikasi(kaki_berselaput).
panda :- mamalia, herbivora,
    verifikasi(memiliki_bulu_hitam_dan_putih),
    verifikasi(makan_bambu).
red_panda :- mamalia, omnivora,
    verifikasi(memiliki_bulu_merah),
    verifikasi(hidup_di_pohon).
merak :- burung,
    verifikasi(memiliki_bulu_berwarna-warni),
    verifikasi(memiliki_ekor_panjang).
pinguin :- burung,
    verifikasi(tidak_terbang),
    verifikasi(berenang),
    verifikasi(memiliki_warna_hitam_putih).
gajah :- mamalia, herbivora,
    verifikasi(memiliki_belalai_panjang),
    verifikasi(berkumpul_dalam_kelompok).
cupang :- ikan, verifikasi(memiliki_warnawarni),
    verifikasi(berenang_sendiri).
marmut :- mamalia, herbivora,
    verifikasi(memiliki_bulu_cokelat),
    verifikasi(memiliki_ekor_pendek).
pika :- mamalia, herbivora,
    verifikasi(memiliki_bulu_abu-abu),
    verifikasi(bersemangat).
klipspringer :- mamalia, herbivora,
    verifikasi(memiliki_kaki_pendek),
    verifikasi(memiliki_bulu_singkat).
musang :- mamalia, karnivora,
    verifikasi(memiliki_bulu_bercoret),
    verifikasi(aktif_di_malam_hari).

/* aturan klasifikasi */
mamalia :- verifikasi(memiliki_rambut), !.
mamalia :- verifikasi(memiliki_kelenjar_susu).
burung :- verifikasi(memiliki_bulu), !.
burung :- verifikasi(terbang),
    verifikasi(meletakkan_telur).
ikan :- verifikasi(berenang), !.
ikan :- verifikasi(memiliki_ekor).
karnivora :- verifikasi(makan_daging), !.
karnivora :- verifikasi(memiliki_gigi_tajam),
    verifikasi(memiliki_cakar),
    verifikasi(memiliki_mata_menghadap_ke_depan).
herbivora :- verifikasi(makan_tumbuhan), !.
herbivora :- verifikasi(memiliki_gigi_datar),
    verifikasi(makan_daun).
omnivora :- verifikasi(makan_daging_dan_tumbuhan).

/* cara mengajukan pertanyaan */
tanya(Pertanyaan) :-
    write('Apakah hewan ini memiliki atribut berikut: '),
    write(Pertanyaan), write('? '),
    read(Jawaban), nl,
    ( (Jawaban == ya ; Jawaban == y)
    -> assert(ya(Pertanyaan)) ;
    assert(tidak(Pertanyaan)), fail).

:- dynamic ya/1,tidak/1.
/* Cara memverifikasi sesuatu */
verifikasi(S) :- (ya(S) -> true ; (tidak(S) -> fail ; tanya(S))).
/* membatalkan semua pernyataan ya/tidak */
batalkan :- retract(ya(_)),fail.
batalkan :- retract(tidak(_)),fail.
batalkan.






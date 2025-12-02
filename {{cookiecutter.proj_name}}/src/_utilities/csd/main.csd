;;  main.csd -*- mode: csound -*-
;;  Combined orchestra and score
;; .csd
<CsoundSynthesizer>
<CsOptions>
;; -o main.wav
-o dac
+rtaudio=jack
;; --realtime
</CsOptions>
<CsInstruments>
sr      = 48000
ksmps   = 64
nchnls  = 2
0dbfs   = 1

instr Hello
  aSine = poscil:a(0.2, p4)
  outall(aSine)  
endin

</CsInstruments>
<CsScore>
i "Hello" 0 2 400
i "Hello" 2 2 500
</CsScore>
</CsoundSynthesizer>

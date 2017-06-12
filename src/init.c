#include <R_ext/RS.h>
#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

extern void F77_NAME(bipf)(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *);
extern void F77_NAME(ctrsc)(void *, void *, void *, void *, void *, void *);
extern void F77_NAME(estepm)(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *);
extern void F77_NAME(ipf)(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *);
extern void F77_NAME(istepm)(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *);
extern void F77_NAME(lobsm)(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *);
extern void F77_NAME(mkpsi)(void *, void *);
extern void F77_NAME(mstepcm)(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *);
extern void F77_NAME(mstepm)(void *, void *, void *, void *, void *, void *, void *, void *, void *);
extern void F77_NAME(pstepcm)(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *);
extern void F77_NAME(pstepm)(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *);
extern void F77_NAME(rngs)(void *);
extern void F77_NAME(stvlm)(void *, void *, void *, void *, void *, void *);
extern void F77_NAME(tobsm)(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *);

static const R_FortranMethodDef FortranEntries[] = {
    {"bipf",    (DL_FUNC) &F77_NAME(bipf),    13},
    {"ctrsc",   (DL_FUNC) &F77_NAME(ctrsc),    6},
    {"estepm",  (DL_FUNC) &F77_NAME(estepm),  33},
    {"ipf",     (DL_FUNC) &F77_NAME(ipf),     12},
    {"istepm",  (DL_FUNC) &F77_NAME(istepm),  36},
    {"lobsm",   (DL_FUNC) &F77_NAME(lobsm),   27},
    {"mkpsi",   (DL_FUNC) &F77_NAME(mkpsi),    2},
    {"mstepcm", (DL_FUNC) &F77_NAME(mstepcm), 19},
    {"mstepm",  (DL_FUNC) &F77_NAME(mstepm),   9},
    {"pstepcm", (DL_FUNC) &F77_NAME(pstepcm), 22},
    {"pstepm",  (DL_FUNC) &F77_NAME(pstepm),  15},
    {"rngs",    (DL_FUNC) &F77_NAME(rngs),     1},
    {"stvlm",   (DL_FUNC) &F77_NAME(stvlm),    6},
    {"tobsm",   (DL_FUNC) &F77_NAME(tobsm),   22},
    {NULL, NULL, 0}
};

void R_init_mix(DllInfo *dll)
{
    R_registerRoutines(dll, NULL, NULL, FortranEntries, NULL);
    R_useDynamicSymbols(dll, FALSE);
}

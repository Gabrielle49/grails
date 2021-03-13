package fonctions

class FonctionUtiles {
    /**
     * Algorithme pour la paggination
     * @param pages
     * @param nombresPaggination
     * @return listePaginer
     */
    def static getXYPaggination(int pages, int nombresPaggination){
        int x = (pages-1)*nombresPaggination
        int y = nombresPaggination
        return [x,y]
    }

    def static getNombreBoutonsPaggination(int totalRows, int nommbrePaggination){
        def reponse
        if(totalRows%nommbrePaggination == 0){
            reponse = totalRows / nommbrePaggination
        }else{
            reponse = ((int) (totalRows /nommbrePaggination))+1
        }
        return reponse

    }
}

process filter_PPRmeta {
      label 'ubuntu'
    input:
      tuple val(name), file(results) 
    output:
      tuple val(name), file("PPRmeta_*.txt")
    script:
      """
      rnd=${Math.random()}
      cat *.csv | grep -v "Header,Length,phage_score," | grep 'phage'| cut -d ',' -f1 > PPRmeta_\${rnd//0.}.txt
      """
}
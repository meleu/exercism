class Complement
  DNA_RNA_COMPLEMENTS = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U'
  }

  def self.of_dna(dna)
    rna = ''

    dna.chars do |nucleotide|
      rna += DNA_RNA_COMPLEMENTS[nucleotide]
    end
    rna
  end
end

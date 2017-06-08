Factory.define :article do |f|
  f.title { fake(:lorem, :words, 5) }
  f.published true
end

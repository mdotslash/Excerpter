require 'combine_pdf' # combine_pdf does the hard work I don't want to

# define some variables

ogPDF =  CombinePDF.load("test.pdf") # pdf you want loaded

wMarkPDF =  CombinePDF.load("mark.pdf").pages[0] # Watermark

newPDF = CombinePDF.new


def twentypct(x,y) # this cuts down the book to 20% of length
  newLastPage = 0.2 * (x.pages.length) #Find 20% of booklength
  # return newlastPage
  #Now we're going to append each page up to the newLastPage to newPDF
  i = 0 # init that bitch
    x.pages.each do |page| # iterate over each page of the ogPDF
    y << page if i < newLastPage # add a page to the new pdf
    i+=1 # check if it's less than 20% of the book, continue or stop if not true
  end
 # deletes all pages after the last page
end

twentypct(ogPDF, newPDF) #makes a pdf that's 20% of the size of the
#
def wMarkBB(pdf, mark) # now we're going to add a watermarked pdf page to page 2 [1] and n
  #add last page first
  pdf << mark
  # p1 = pdf.pages[0] # get first page and save to another v
  # p1 << mark # insert mark

  pdf.insert(1, mark) #save first page to another pdf a blank page
  # add to second page
  # pdf.pages[1] << mark
end

wMarkBB(newPDF, wMarkPDF)

newPDF.save "new_excerpt.pdf" # save that mofo

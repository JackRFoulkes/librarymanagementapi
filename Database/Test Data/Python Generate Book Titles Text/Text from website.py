from urllib.request import urlopen
from bs4 import BeautifulSoup
import os
import time

# Print iterations progress
def printProgressBar (iteration, total, prefix = '', suffix = '', decimals = 1, length = 100, fill = '█', printEnd = "\r"):
    """
    Call in a loop to create terminal progress bar
    @params:
        iteration   - Required  : current iteration (Int)
        total       - Required  : total iterations (Int)
        prefix      - Optional  : prefix string (Str)
        suffix      - Optional  : suffix string (Str)
        decimals    - Optional  : positive number of decimals in percent complete (Int)
        length      - Optional  : character length of bar (Int)
        fill        - Optional  : bar fill character (Str)
        printEnd    - Optional  : end character (e.g. "\r", "\r\n") (Str)
    """
    percent = ("{0:." + str(decimals) + "f}").format(100 * (iteration / float(total)))
    filledLength = int(length * iteration // total)
    bar = fill * filledLength + '-' * (length - filledLength)
    print(f'\r{prefix} |{bar}| {percent}% {suffix}', end = printEnd)
    # Print New Line on Complete
    if iteration == total: 
        print()

timesotrun = 1000
url = "https://titlegenerator.com/"
filePath = "C:\\Users\\Jack\\Desktop\\Books.txt"
outputPath = "C:\\Users\\Jack\\Desktop\\BooksList.txt"
i = 1

print("\nFetching list of books...\n")
# Initial call to print 0% progress
printProgressBar(0, timesotrun, prefix = 'Progress:', suffix = 'Complete', length = 50)
while i < timesotrun:

    html = urlopen(url).read()
    soup = BeautifulSoup(html, features="html.parser")

    # kill all script and style elements
    for script in soup(["script", "style"]):
        script.extract()    # rip it out

    # get text
    text = soup.body.get_text()

    # break into lines and remove leading and trailing space on each
    lines = (line.strip() for line in text.splitlines())
    # break multi-headlines into a line each
    chunks = (phrase.strip() for line in lines for phrase in line.split("  "))
    # drop blank lines
    text = '\n'.join(chunk for chunk in chunks if chunk)

    # remove first three lines
    text = text.split("\n", 3)[3]

    # remove last three lines
    text = text.rsplit("\n", 3)[0]

    # remove any single quotes
    finalString = text.replace("'", "")

    # open file to place book names into
    f = open(filePath, "a")

    # if the file is empty add the books or not add a line space
    if os.stat(filePath).st_size == 0:
        f.write(finalString)
    else:
        f.write( "\n" + finalString)

    f.close()
    
    i+= 1
    printProgressBar(i, timesotrun, prefix = 'Progress:', suffix = 'Complete', length = 50)

print("\nRemoving duplicates...\n")
input_file = filePath
with open(input_file, "r") as fp:
    lines = fp.readlines()
    printProgressBar(0, len(lines), prefix = 'Progress:', suffix = 'Complete', length = 50)
    new_lines = []
    i=0
    for line in lines:
        i+=1
        #- Strip white spaces
        line = line.strip()
        if line not in new_lines:
            new_lines.append(line)
        printProgressBar(i, len(lines), prefix = 'Progress:', suffix = 'Complete', length = 50)

with open(outputPath, "w") as fp:
    fp.write("\n".join(new_lines))

os.remove(filePath)
print("\nFinished...\n")
# Victoria Palin, Anna Molter, Miguel Belmonte, Darren M Ashcroft, Andrew White, William Welfare, Tjeerd van Staa, 2024.

import sys, csv, re

codes = [{"code":"H04..00","system":"readv2"},{"code":"H042.00","system":"readv2"},{"code":"H041z00","system":"readv2"},{"code":"H052.00","system":"readv2"},{"code":"H042z00","system":"readv2"},{"code":"H042.11","system":"readv2"},{"code":"H04z.00","system":"readv2"},{"code":"H041.00","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('upper-respiratory-tract-infection-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["upper-respiratory-tract-infection-urti-laryngotracheitis---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["upper-respiratory-tract-infection-urti-laryngotracheitis---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["upper-respiratory-tract-infection-urti-laryngotracheitis---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
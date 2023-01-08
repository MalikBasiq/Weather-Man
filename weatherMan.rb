=begin

       Weather Man app created by Muhammad Basiq Naeem
       Software Engineer Intern At Devsinc

=end


require 'colorize' #package to display colorize symbols



def Heighest_Values_in_a_Year(area,year)

#array to hold mon name so that we can iterate over the year
    monthnames = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
    counter=0;
    maxTemp=0;
    largest=1; #to get heighest_values of temp in a year
    smallest=100; #to get min_values of temp in a year
    maxhum=0; #to get heighest_values of humidity in a year
    minTemp=0;
    humiditiy = 0;

    #to get day number of a month which holds the require values i.e heighest temperature day
    max_temp_Day=0;
    min_temp_Day=0;
    max_hum_Day=0;

    #to get the month which holds the require values i.e heighest temperature month
    max_temp_Month="";
    min_temp_Month="";
    max_hum_Month="";

   
    for i in 0..11 # loop to iterate months

        filetoread = "#{area}_weather/#{area}_weather_#{year}_#{monthnames[i]}.txt"

    
        if (File.exists?(filetoread)) #checking file exists or not

            toread = File.readlines("#{area}_weather/#{area}_weather_#{year}_#{monthnames[i]}.txt")

            toread.each do |line|

            columns = line.split(",") #spliting row using ,

                 if(columns[1]!=nil && !columns[1].empty? && columns[1]!="Max TemperatureC" )

                        counter+=1; #incrementing counter to get day

                        maxTemp = columns[1].to_i  #col1 contains max temp stating from 0

                        if (maxTemp>largest)
                                largest = maxTemp;
                                 max_temp_Day=counter;
                                 max_temp_Month=monthnames[i];
                    
                        end
                
                         minTemp= columns[3].to_i  #col3 contains min temp stating from 0

                        if (minTemp<smallest)
                                  smallest = minTemp;
                                  min_temp_Day=counter;
                                  min_temp_Month=monthnames[i];
                        end
                         humiditiy= columns[7].to_i #col7 contains max humidity  stating from 0
                        if (humiditiy>maxhum)
                                 maxhum=humiditiy;
                                 max_hum_Day=counter;
                                 max_hum_Month=monthnames[i];
                    
                        end
                
                end
            end
    
        else
            puts "\n***Sorry #{area}_weather/#{area}_weather_#{year}_#{monthnames[i]}.txt  Does not exist"
        end


        counter=0;
    end
    puts("\n\n++Displaying the  highest temperature,  lowest temperature, most humid day of a Year from existing files++")
    puts("=================================================================================================")

    puts("\n•Highest :#{largest}℃  on #{max_temp_Month} #{max_temp_Day} ");
    puts("\n•Lowest :#{smallest}℃  on #{min_temp_Month} #{min_temp_Day}");
    puts("\n•Humid: #{maxhum}%  on #{max_hum_Month} #{max_hum_Day}");

    puts("\n=================================================================================================")


   
    
end


def avg_min_max_hum(area,year,month)

    toread = File.readlines("#{area}_weather/#{area}_weather_#{year}_#{month}.txt")


    counter=0;
    maxTemp=0;
    minTemp=0;
    humiditiy = 0;

    if toread

             toread.each do |line|

                columns = line.split(",")

                if(columns[1]!=nil && !columns[1].empty? && columns[1]!="Max TemperatureC" )

                    maxTemp = maxTemp + columns[1].to_i  #col1 contains max temp stating from 0

                    minTemp= minTemp + columns[3].to_i  #col3 contains min temp stating from 0

            
                    humiditiy= humiditiy+ columns[8].to_i #col4 contains mean humidity  stating from 0

                    counter+=1;  

                end
            
            end
         

          puts("\n++Displaying the average highest temperature, average lowest temperature, average humidity.++")
          puts("=================================================================================================")

          puts("\n•Highest Average: #{maxTemp/counter}℃ ");
          puts("\n•Lowest Average: #{minTemp/counter}℃  ");
          puts("\n•Average Humidity: #{humiditiy/counter}% ");

          puts("\n=================================================================================================")
          
     else
        puts "Unable to open file!"
     end
     
end
#end of a function


#start of  two horizontal bar charts function

def  two_horizontal_bar_charts(area,year,month)
    toread = File.readlines("#{area}_weather/#{area}_weather_#{year}_#{month}.txt")

    counter=0;
    maxTemp=0;
    minTemp=0;
    
    if toread
        toread.each do |line|

            columns = line.split(",")
            if(columns[1]!=nil && !columns[1].empty? && columns[1]!="Max TemperatureC" )
                minTemp = columns[3].to_i
                maxTemp = columns[1].to_i;

                #loop to print max temperature bars
                counter=counter + 1;
                print"#{counter}"
                for i in 1..maxTemp
                    print "+".red  #printing in red
                
                 end

                print "#{maxTemp}℃ "

                print"\n"

                #loop to print min temperature bars
                print"#{counter}"

                for i in 1..minTemp
                    print "+".blue  #printing in blue
                
                
                end

                 print "#{minTemp}℃ "

                 print"\n"
           
            end
        end
          
         
    else
        puts "Unable to open file!"
    end
end



#bonus function
def  bar_charts_on_same_line(area,year,month)
    
    toread = File.readlines("#{area}_weather/#{area}_weather_#{year}_#{month}.txt")

    counter=0;
    maxTemp=0;
    minTemp=0;
    
    if toread
        toread.each do |line|

            columns = line.split(",")
            if(columns[1]!=nil && !columns[1].empty? && columns[1]!="Max TemperatureC" )
                minTemp = columns[3].to_i
                maxTemp = columns[1].to_i;

                counter=counter + 1;
                print"#{counter}"
                #loop to print min temperature bars

                for i in 1..minTemp
                    print "+".blue   #printing in blue
                
                    
                 end
                #loop to print max temperature bars
                
                for i in 1..maxTemp
                    print "+".red  #printing in red
                
                 end
                 
                 

                 print " #{minTemp}℃ -- #{maxTemp}℃ "
                 print"\n"
           
            end
          end
          #counter=counter-1; # to eliminate string line like Max temperatureC
          
     else
        puts "Unable to open file!"
     end
end






# main program
    puts "\n\n+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    puts "NOTE::::Please First install this package by using command "'"gem install colorize "'" in order to see colorize symbols otherwise you will get an error."
    puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

    puts "\n\n=========================================="
    puts "           WELCOME TO WEATHERMAN          "
    puts "=========================================="

#do while loop
begin
   #body
   print "\nEnter Area i.e lahore, Dubai, Murree please enter the name in the same way as described = ";
   geographicArea= gets.chomp;
   
   print "Enter Year between 2004 and 2011 inclusive = ";
   year= gets.chomp;

   print "Enter Month name only write first 3 letters in camel case i.e Dec = ";
   month= gets.chomp;
   
   
   
   filetoread = "#{geographicArea}_weather/#{geographicArea}_weather_#{year}_#{month}.txt"
   
   
   if (File.exists?(filetoread))
      

       puts "\n************************************************************************************"
       print "|Press 1 to display highest temperature day, lowest temperature day, most humid day and humidity in a given year  ";
       print "\n|Press 2 to display the average highest temperature, average lowest temperature, average humidity of a given month  ";
       print "\n|Press 3 to display two horizontal bar charts for the highest and lowest temperature on each day of a month  ";
       print "\n|Press 4 to display horizontal bar chart on same line  for each day of a month  ";
       print "\n|Press 5 to Exit = ";
       puts "\n************************************************************************************"

       print "\nPlease Enter your choice = ";
        opt=gets.chomp.to_i; 

        case opt
        when 1
            Heighest_Values_in_a_Year(geographicArea,year);
        when 2
            avg_min_max_hum(geographicArea,year,month);
        when 3
            two_horizontal_bar_charts(geographicArea,year,month);
        when 4
            bar_charts_on_same_line(geographicArea,year,month);
        when 5
            puts "\n\n\n=========================================="
            puts "THANK YOU FOR USING WEATHER MAN GOOD BYE!"
            puts "=========================================="
   
        else
        puts "Enter your Choice in range of 1-5 "
        end
   else
       puts "\n=================================================================================================="
       puts "***Sorry #{geographicArea}_weather/#{geographicArea}_weather_#{year}_#{month}.txt  Does not exist"
       puts "====================================================================================================\n"
   end

   
end while opt != 5




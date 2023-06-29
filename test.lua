-- Function to print the current date
function print_yesterdays_date()
    -- Get the current time in seconds since epoch
    local current_time = os.time()

    -- Subtract 24 hours (in seconds) from current_time to get yesterday's time
    local yesterdays_time = current_time - 24 * 60 * 60

    -- Convert the time to a table with fields for year, month, day, hour, minute, and second
    local yesterdays_date = os.date("*t", yesterdays_time)

    -- Print yesterday's date in the format "YYYY-MM-DD"
    print(string.format("%04d-%02d-%02d", yesterdays_date.year, yesterdays_date.month, yesterdays_date.day))
end

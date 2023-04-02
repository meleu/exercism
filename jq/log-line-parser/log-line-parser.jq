# This function will remove leading and trailing whitespace
# from the input string.
def trim: sub("^\\s+"; "") | sub("\\s+$"; "");

# Task 1. Get message from a log line
def message:
  . / ":" 
  | .[1] 
  | trim
;

# Task 2. Get log level from a log line
def log_level:
  . / ":" 
  | .[0] 
  | gsub("[][]+"; "") 
  | ascii_downcase
;

# Task 3. Reformat a log line
def reformat:
  "\(message) (\(log_level))"
;

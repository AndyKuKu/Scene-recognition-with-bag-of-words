start = datetime
fprintf("Computing...\n")
computeDictionary;
fprintf("Done.\n")

fprintf("Building...\n")
buildRecognitionSystem;
fprintf("Done\n")

fprintf("Evaluating...\n")
evaluateRecognitionSystem;
fprintf("Done\n")
finish = datetime
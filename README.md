# CSCI-400 Homework #2 (Individual)

## Setting up the Repository
- **READ THIS FIRST!!**
- **DO NOT CLONE THIS REPO!!!**
- This README and accompanying skeleton code are contained in
  the read-only *assignment* repository --
  you will be able to pull from here, but not push.
- To get started on the assignment, first go to your
  *personal* repository for this assignment, and
  carefully follow the `INSTRUCTIONS.md` file there.
- The basic idea is: you will first clone your personal
  repository (**not** this assignment repo), and then
  add a (read only) remote to pull
  the skeleton code from this assignment repository.

## Basic Instructions

- Typing `make` should build your code.
- Typing `make hw02` should build your Homework #2 code, and run its unit tests.
- Each unit test is a tuple of the form `(optional_name, input, expected_output)`,
  where `optional_name` can either be `None` or `Some(x)`, where `x` is a
  human-readable name for the unit test. The `expected_output` is a `result` type,
  which allows you to use `Ok(out)` for regular output `out`, or `Error(ex)` if
  the unit test is expected to generate an exception `ex`.
- Note that the generated files `*.types` show the types for each of the functions
  in the corresponding file.

## Rubric

- The total score is out of 100 points.
- You will submit your own (passing) test cases for each task.
- The instructors/TAs will run your code with a "secret" test-case suite, and
  grade based on number of passing tests.
- Please provide concise documentation for each piece of code you write.

| Item                                        | Points |
|---------------------------------------------|--------|
| Task 1: submit passing test cases           | 30     |
| Task 2: submit passing test cases           | 10     |
| Task 2: pass secret instructor test cases   | 20     |
| Task 3: submit passing test cases           | 10     |
| Task 3: pass secret instructor test cases   | 20     |
| Documentation                               | 10     |

## Task 1

- Add at least 5 new test cases for the function `get_duration` in `homework02.ml`
  (your test cases should be added to the `sheet_music_tests` list, as marked with
  the `TODO` comment).
- No code is required for Task 1 (only test cases).

## Task 2

- Add functions `traverse2_pre` and `traverse2_post` (similar to `traverse2`) in `homework02.ml`
  which perform pre-order and post-order traversal of a list respectively (returning the new list).
- Add at least 5 test cases for each of your functions in `homework02.ml` (your tests should
  be added to the `tree_tests_pre` and `tree_tests_post` lists respectively, as marked with
  the `TODO comments).

## Task 3

- In `hw02.ml`, implement a recursive function `(sum n)` which produces
  the result `2 + 4 + 8 + ...` for the first *n* powers of 2 (where *n* is a non-negative integer).
  Your function should return `0` for a non-positive input.
  Do not use any built-in OCaml functions.
- In `hw02.ml`, add at least 5 tests cases for your `sum` function (your test cases
  should be added to the `sum_tests` list, as indicated by the `TODO` comment).

## Documentation

- Please provide concise documentation for each function written in Task 2 and Task 3.

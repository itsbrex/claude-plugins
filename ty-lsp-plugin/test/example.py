def add_numbers(a: int, b: int) -> int:
    """Add two integers together."""
    return a + b


def greet(name: str) -> str:
    """Greet someone by name."""
    return f"Hello, {name}!"


# This should cause a type error - passing string to int parameter
result = add_numbers("5", 10)

# This should also cause a type error - passing int to str parameter
greeting = greet(42)

# This should be fine
correct_result = add_numbers(5, 10)
correct_greeting = greet("World")

print(correct_result, correct_greeting)

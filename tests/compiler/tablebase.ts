function foo(): void {}

const staticFunction = foo;

assert(ASC_TABLE_BASE == 32);
assert(changetype<usize>(staticFunction) == 32);

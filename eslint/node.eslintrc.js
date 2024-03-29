module.exports = {
    env: {
        browser: true,
        commonjs: true,
        es2021: true,
    },
    extends: ["airbnb-base"],
    parser: "@typescript-eslint/parser",
    parserOptions: {
        ecmaVersion: 12,
    },
    plugins: ["@typescript-eslint"],
    rules: {
        indent: ["error", 4],
        quotes: ["error", "double"],
        semi: ["error", "always"],
        "no-console": "warn",
        "no-unused-vars": "warn",
        "no-useless-catch": "warn",
        "no-undef": "error",
        "arrow-parens": 0,
    },
}

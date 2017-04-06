// Karma configuration file, see link for more information
// https://karma-runner.github.io/0.13/config/configuration-file.html

module.exports = function(config) {
    config.set({
        basePath: '',
        frameworks: ['jasmine', '@angular/cli', 'fixture'],
        plugins: [
            require('karma-jasmine-html-reporter'),
            require('karma-coverage-istanbul-reporter'),
            require('karma-jasmine'),
            require('karma-chrome-launcher'),
            require('@angular/cli/plugins/karma'),
            require('karma-json-fixtures-preprocessor'),
            require('karma-fixture'),
            require('karma-html2js-preprocessor')
        ],
        files: [{
            client: {
                clearContext: false // leave Jasmine Spec Runner output visible in browser
            },
            pattern: './src/test.ts',
            watched: false
        },
            './fixtures/**/*.json'
        ],
        preprocessors: {
            './src/test.ts': ['@angular/cli'],
            '**/*.json'   : ['json_fixtures']
        },
        mime: {
            'text/x-typescript': ['ts', 'tsx']
        },
        coverageIstanbulReporter: {
            reports: {
                html: 'coverage',
                lcovonly: './coverage/coverage.lcov'
            }
        },
        jsonFixturesPreprocessor: {
            variableName: '__json__'
        },
        angularCli: {
            environment: 'dev'
        },
        reporters: config.angularCli && config.angularCli.codeCoverage ? ['progress', 'coverage-istanbul'] : ['progress', 'kjhtml'],
        port: 9876,
        colors: true,
        logLevel: config.LOG_INFO,
        autoWatch: true,
        browsers: ['Chrome'],
        singleRun: false
    });
};
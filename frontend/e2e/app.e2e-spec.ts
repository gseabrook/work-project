import { MydiretdebitPage } from './app.po';

describe('mydiretdebit App', function() {
  let page: MydiretdebitPage;

  beforeEach(() => {
    page = new MydiretdebitPage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});

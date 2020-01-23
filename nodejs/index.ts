import markdown from 'markdown-pdf'

markdown().from('../readme.md').to('./dist/readme.pdf', () => {
  console.log('Done')
})

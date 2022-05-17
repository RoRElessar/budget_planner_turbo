import { Controller } from '@hotwired/stimulus'
import { FetchRequest } from '@rails/request.js'

export default class extends Controller {
  clear(event) {
    setTimeout(async () => {
      const request = new FetchRequest('get', '/notice', { responseKind: 'turbo-stream' })
      await request.perform()
    }, 5000)

    event.target.requestSubmit()
  }
}

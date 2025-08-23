import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  open(event) {
    event.preventDefault()
    const logId = event.currentTarget.dataset.logId

    fetch(`/user_carebit_logs/${logId}`)
      .then(res => res.json())
      .then(data => {
        // 既に存在するモーダルがあれば削除（重複防止）
        const existingModal = document.getElementById("log-modal")
        if (existingModal) existingModal.remove()

        // モーダル本体を生成
        const modal = document.createElement("div")
        modal.id = "log-modal"
        modal.className = "fixed inset-0 flex items-center justify-center z-50"

        modal.innerHTML = `
          <div class="bg-green-50 rounded-lg shadow-lg p-8 w-[32rem] border-4 border-green-600 relative">
            <h3 class="text-xl font-bold mb-6 text-center text-green-800">Carebitの記録</h3>

            <div class="text-center">
              <p class="text-sm text-gray-600 mb-2">${data.performed_on}</p>
              <p class="font-bold text-lg text-gray-800 mb-4">${data.action}</p>
              ${data.diary_note
            ? `<div class="mt-2 p-3 w-full bg-green-100 rounded text-gray-700 text-sm">${data.diary_note}</div>`
            : `<p class="text-gray-500 italic mt-2">（日記は記録されていません）</p>`
          }
            </div>

            <div class="mt-6 flex justify-end gap-3">
              <button type="button"
                class="px-5 py-3 bg-gray-300 rounded hover:bg-gray-400 cursor-pointer transition font-semibold"
                onclick="document.getElementById('log-modal').remove()">
                閉じる
              </button>
            </div>
          </div>
        `

        // body に追加
        document.body.appendChild(modal)
      })
  }
}

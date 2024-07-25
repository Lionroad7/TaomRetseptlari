//
//  ASYNCimage.swift
//  TaomRetseptlari_IndividualProject
//
//  Created by islombek on 25/07/24.
//

import SwiftUI

struct AsyncImage<Placeholder: View>: View {
    @State private var phase: AsyncImagePhase = .empty

    private let url: URL?
    private let scale: CGFloat
    private let transaction: Transaction
    private let content: (AsyncImagePhase) -> Placeholder

    init(url: URL?, scale: CGFloat = 1.0, transaction: Transaction = Transaction(), @ViewBuilder content: @escaping (AsyncImagePhase) -> Placeholder) {
        self.url = url
        self.scale = scale
        self.transaction = transaction
        self.content = content
    }

    var body: some View {
        content(phase)
            .onAppear(perform: load)
    }

    private func load() {
        guard case .empty = phase else { return }

        phase = .loading

        guard let url = url else {
            phase = .failure(nil)
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let data = data, let image = UIImage(data: data) {
                    phase = .success(Image(uiImage: image))
                } else {
                    phase = .failure(error)
                }
            }
        }
        task.resume()
    }
}

enum AsyncImagePhase {
    case empty
    case loading
    case success(Image)
    case failure(Error?)

    var image: Image? {
        if case .success(let image) = self {
            return image
        }
        return nil
    }

    var error: Error? {
        if case .failure(let error) = self {
            return error
        }
        return nil
    }
}


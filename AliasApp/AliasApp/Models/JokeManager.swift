import Foundation

//MARK: - JokeManager
protocol JokeManagerDelegate {
    func didUpdateJoke(_ jokeManager: JokeManager, joke: JokeModel)
}

struct JokeManager {
    
    var delegate: JokeManagerDelegate?
    
    let jokeURL = "https://joke.deno.dev"
    
    func fetchJoke() {
        performRequest(with: jokeURL)
    }
    func performRequest(with urlString: String) {
        let url = URL(string: urlString)
        guard let url = url else { return }
        let urlSession = URLSession(configuration: .default)
        let dataTask = urlSession.dataTask(with: url) { (data, response, error) in
            guard let data = data,
                  error == nil else { return }
            if let joke = self.parseJSON(data) {
                delegate?.didUpdateJoke(self, joke: joke)
            }
        }
        dataTask.resume()
    }
    func parseJSON(_ jokeData: Data) -> JokeModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(JokeData.self, from: jokeData)
            let jokeText = decodedData.setup
            let joke = JokeModel(jokeContent: jokeText)
            return joke
        } catch {
            return nil
        }
    }
}

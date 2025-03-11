import { useState } from 'react'
import TutorialCard from './Components/TutorialCard'
import { useEffect } from 'react'
import './App.css'

function App() {
  const [visible, setVisible] = useState(false)
  const [tutorialText, setTutorialText] = useState('')
  const [tutorialTitle, setTutorialTitle] = useState('')

  useEffect(() => {
    const handleMessage = (event: MessageEvent) => {
      if (event.data.action === 'toggle') {
        setVisible(event.data.visible)
        if (event.data.name && event.data.desc) { // Fixed to check for desc instead of title
          setTutorialText(event.data.name)
          setTutorialTitle(event.data.desc)
        }
      } else if (event.data.action === 'updateTutorial') {
        setTutorialText(event.data.name)
        setTutorialTitle(event.data.desc)
      }
    }

    window.addEventListener('message', handleMessage)

    return () => {
      window.removeEventListener('message', handleMessage)
    }
  }, [])

  return (
    <>
      {visible && <TutorialCard title={tutorialTitle} text={tutorialText} />}
    </>
  )
}

export default App

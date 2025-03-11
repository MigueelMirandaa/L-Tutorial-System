import React, { useCallback } from 'react';
import { FaArrowRight } from 'react-icons/fa';
import './TutorialCard.css';

interface TutorialCardProps {
    title: string;
    text: string;
}

const TutorialCard: React.FC<TutorialCardProps> = ({ title, text }) => {
    const handleNext = useCallback(() => {
        const response = fetch('https://L-Tutorial/NextTutorial')
            .then((response) => {
                // console.log('Tutorial advanced:', response);
            })
            .catch((err) => {
                // console.error('Error advancing tutorial:', err);
            });
    }, []);

    return (
        <div className="tutorial-container">   
                        
            <div className="tutorial-card">
            <img src="https://pngimg.com/d/gta_PNG57.png" alt="NPC" />      
                <div className="card-content">
                    <h2 className="card-title">
                        {text}
                    </h2>
                    
                    <p className="card-text">
                        {title}
                    </p>
                    
                    <div className="button-container">
                        <button 
                            onClick={handleNext}
                            className="next-button"
                        >
                            <span>Continuar</span>
                            <FaArrowRight />
                        </button>
                    </div>
                </div>
            </div>
        </div>
    );
};

export default TutorialCard;
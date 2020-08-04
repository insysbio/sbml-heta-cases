#= 
    This code was generated by heta-compiler of v0.5.9
    
=#

module julia 
using SimSolver

### create default constants
constants_ = NamedTuple{(
  
)}(Float64[
  
])

### initialization of ODE variables and Records
function start_(cons)
    #() = cons

    # Heta initialize
    t = 0.0 # initial time
    kf = 1.1
    C = 1.0
    S1 = 1.0 / C
    S2 = 0.5 / C
    kr = 0.09
    S3 = 0.4 / C
    reaction1 = C * (kf * S1 * S2 + (-1.0) * kr * S3)
    
    # save results

    return (
        [
            S1 * C,
            S2 * C,
        ],
        
        [
            C,
            S3,
            kf,
            kr,
        ]
    )
end

### calculate RHS of ODE
function ode_(du, u, p, t)
    cons = p.constants
    (C,S3,kf,kr,) = p.static
    (S1_,S2_,) = u 

    # Heta rules
    S1 = S1_ / C
    S2 = S2_ / C
    reaction1 = C * (kf * S1 * S2 + (-1.0) * kr * S3)
    
    #p.static .= [C,S3,kf,kr,]
    du .= [
      -reaction1,  # dS1_/dt
      -reaction1,  # dS2_/dt
    ]
end

### output function
function make_saving_(outputIds::Vector{Symbol})
    function saving_(u, t, integrator)
        cons = integrator.p.constants
        (C,S3,kf,kr,) = integrator.p.static
        (S1_,S2_,) = u

        # Heta rules
        S1 = S1_ / C
        S2 = S2_ / C
        reaction1 = C * (kf * S1 * S2 + (-1.0) * kr * S3)
        
        # calculate amounts
        C_ = C
        S3_ = S3 * C
        reaction1_ = reaction1
        kf_ = kf
        kr_ = kr

        d = Base.@locals
        return [d[id] for id in outputIds]
    end
end

### time events

### discrete events

### continous events

### event assignments


### OUTPUT ###

x00822 = Model(
  start_,
  ode_,
  [
  ],
  make_saving_,
  constants_
)

models = (
    x00822 = x00822
)
tasks = ()

export models, tasks

end
